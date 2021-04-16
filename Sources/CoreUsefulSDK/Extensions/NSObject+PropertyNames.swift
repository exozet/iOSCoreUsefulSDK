//
//  NSObject+Utils.swift
//  DigitalAssortmentPlanner
//
//  Created by Philipp Homann on 29.04.20.
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


extension NSObject {

    //
    // Retrieves an array of property names found on the current object
    // using Objective-C runtime functions for introspection:
    // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
    // ATTENTION: this is only checking for properties of this class and recursive all supers if you want
    // You also could call this directly from an instance, see propertyNames() below
	@objc public static func propertyNamesOfClass(inclSuperClasses: Bool) -> Array<String>? {
		var count : UInt32 = 0
		var results: Array<String> = []

        // retrieve the properties via the class_copyPropertyList function
		guard let properties = class_copyPropertyList(self, &count) else {
			return nil
		}
		
		for i in 0..<count {
			// iterate each objc_property_t struct
			let property = properties[Int(i)];

			if let name = self.getNameOf(property: property) {
				results.append(name);
			}
        }
		free(properties)
		
		if inclSuperClasses == true {
			// recursive call
			if let superclass = self.superclass(), let superclassResult = superclass.propertyNamesOfClass(inclSuperClasses: inclSuperClasses) {
				results.append(contentsOf: superclassResult)
			}
		}
		
		
		return results
	}

	

    //
    // Retrieves an array of property names found on the current object
    // using Objective-C runtime functions for introspection:
    // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
    // ATTENTION: this is only checking for properties of this class and recursive all supers if you want
    public func propertyNames(inclSuperClasses: Bool = true) -> Array<String>? {
        var results: Array<String>?

		// get class of this instance
        let thisClass: AnyClass = self.classForCoder
        
		results = thisClass.propertyNamesOfClass(inclSuperClasses: inclSuperClasses )

        return results;
    }
    
    
    @objc static func getNameOf(property: objc_property_t) -> String? {
        guard let name: NSString = NSString(utf8String: property_getName(property)) else { return nil }
        return name as String
    }

}


