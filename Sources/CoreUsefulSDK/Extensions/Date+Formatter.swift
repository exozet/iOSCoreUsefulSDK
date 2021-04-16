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

    
    var calendarIso8601: Calendar {
        return Calendar(identifier: .iso8601)
    }
    
    var dayOfMonth: Int {
        return calendarIso8601.component(.day, from: self)
    }
    
    var monthOfYear: String {
        return month
    }
    
    var year: Int {
        return calendarIso8601.component(.year, from: self)
    }
    
    var monthDays: [Date] {
        
        let monthDayRange = calendarIso8601.range(of: .day, in: .month, for: self)!
        let days = (monthDayRange.lowerBound ..< monthDayRange.upperBound)
            .compactMap { calendarIso8601.date(byAdding: .day, value: $0 - self.dayOfMonth, to: self) }
        return days
    }
    
    var startOfDay: Date {
          return Calendar.current.startOfDay(for: self)
      }
    
    var firstDayOfMonth: Date? {
        return monthDays.first?.startOfDay
    }
    
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return  calendarIso8601.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    
    
    /// Returns ISO 8601 formated string of the date
    func iso8601() -> String {
        let formatter = DateFormatter()
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        formatter.locale = enUSPosixLocale
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.calendar = Calendar(identifier: .gregorian)
        
        return formatter.string(from: self)
    }
    
    
    /// returns an array of date object between two dates
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
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
    
    /// Checks two date objects and compares do they represent same month on the calendar.
    /// - parameter date: Date object to compare
    /// - returns: `true` if two date objects have same month
    func isSameMonth(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .month)
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
    
    
    // MARK: private stuff
    
    private var month: String {
        return self.format(with: "MMMM")
    }
    
    private func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    
}
