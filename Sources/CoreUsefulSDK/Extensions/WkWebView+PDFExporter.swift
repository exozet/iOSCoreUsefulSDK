//
//  WkWebView-Extension.swift
//  PDFCreator
//
//  Created by Philipp Homann on 15.01.20.
//  Copyright © 2020 Endava. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import Foundation
import WebKit

// https://stackoverflow.com/questions/15813005/creating-pdf-file-from-uiwebview


public extension WKWebView {

    /// Call this function when WKWebView finish loading
    /// - Parameter title: Title of the PDF file.
    /// - Returns: PDF path.
    func exportAsPdf(fileName: String) -> String {
        let pdfData = createPdfFile(printFormatter: self.viewPrintFormatter())
        return self.saveWebViewPdf(data: pdfData, fileName: fileName)
    }

    func createPdfFile(printFormatter: UIViewPrintFormatter) -> NSMutableData {
        let leftPadding : CGFloat = 0
        let rightPadding : CGFloat = 0
        let topPadding : CGFloat = 0
        let bottomPadding : CGFloat = 0
        
        // A4 DPI 72 https://www.papersizes.org/a-sizes-in-pixels.htm
        let paperWidth : CGFloat = 841.88976377953
        let paperHeight : CGFloat = 595.27559055

        // printable rect
        let printableRect = CGRect(x: leftPadding,
                             y: topPadding,
                             width: paperWidth - leftPadding - rightPadding,
                             height: paperHeight - topPadding - bottomPadding
        )
        let paperRect = CGRect(x: 0, y: 0, width: paperWidth, height: paperHeight)
        
        
        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        printPageRenderer.headerHeight = 0
        printPageRenderer.footerHeight = 0
        
        printPageRenderer.setValue(NSValue(cgRect: paperRect), forKey: "paperRect")
        printPageRenderer.setValue(NSValue(cgRect: printableRect), forKey: "printableRect")
        return printPageRenderer.generatePdfData()
    }

    // Save pdf file in document directory
    func saveWebViewPdf(data: NSMutableData, fileName: String) -> String {

        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        var fileName = fileName + "_" + Date().format(with: "yyyy-MM-dd_HH:mm:ss")
        
        fileName = fileName.convertToValidFileName()
		fileName = fileName.appending(".pdf")

        let pdfPath = docDirectoryPath.appendingPathComponent(fileName)
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}


extension UIPrintPageRenderer {

    func generatePdfData() -> NSMutableData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSMakeRange(0, self.numberOfPages))
        let printRect = UIGraphicsGetPDFContextBounds()
        for pdfPage in 0..<self.numberOfPages {
            UIGraphicsBeginPDFPage()
            self.drawPage(at: pdfPage, in: printRect)
        }
        UIGraphicsEndPDFContext();
        return pdfData
    }
}
