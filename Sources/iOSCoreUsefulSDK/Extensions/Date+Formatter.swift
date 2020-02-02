// Date+Formatter.swift
//
// Copyright (c) 2020 Burak Uzunboy
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

public extension Date {
    
    /// Checks two date objects and compares do they represent same day on the calendar.
    /// - parameter date: Date object to compare
    /// - returns: `true` if two date objects have same day, month and year.
    func isSameDay(with date: Date) -> Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .day, .month], from: self)
        let otherDayComponents = calendar.dateComponents([.year, .day, .month], from: date)
        if components.day == otherDayComponents.day &&
            components.month == otherDayComponents.month &&
            components.year == otherDayComponents.year {
            return true
        }
        
        return false
    }
    
    /// Returns date object with the given format as string.
    func format(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Returns `true` if date corresponds today.
    var isToday: Bool {
        return self.isSameDay(with: Date())
    }
    
    /// Returns `true` if the date corresponds to yesterday.
    var isYesterday: Bool {
        return self.isSameDay(with: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
    }
    
    /// Returns `true` if the date corresponds to tomorrow.
    var isTomorrow: Bool {
        return self.isSameDay(with: Calendar.current.date(byAdding: .day, value: +1, to: Date())!)
    }
    
    /// Returns `true` if the date corresponds to day after tomorrow.
    var isTheDayAfterTomorrow: Bool {
        return self.isSameDay(with: Calendar.current.date(byAdding: .day, value: +2, to: Date())!)
    }
    
}
