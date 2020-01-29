//
//  Date+Formatter.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 16.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

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
