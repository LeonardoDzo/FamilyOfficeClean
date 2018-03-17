//
//  Date+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension Date {

    /// Prints a string representation for the date with the given formatter
    func string(with format: DateFormatter) -> String {
        return format.string(from: self as Date)
    }

    /// Creates an `NSDate` from the given string and formatter. Nil if the string couldn't be parsed
    init?(string: String, formatter: DateFormatter) {
        guard let date = formatter.date(from: string) else { return nil }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    init?(_ date: Int) {
        self.init(timeIntervalSince1970: TimeInterval(date))
    }
    
    init(year: Int = 1970, month: Int = 1, day: Int = 1) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self = Calendar.current.date(from: components)!
    }

    func toMillis() -> Int! {
        return Int(self.timeIntervalSince1970)
    }
    
    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func startOfYear() -> Date {
        return Calendar.current.date(
            from: Calendar.current.dateComponents([.year], from: self)
        )!
    }
    
    func endOfDay() -> Date {
        return self.startOfDay().add(hours: 23, minutes: 59, seconds: 59)
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }

    func midnight() -> Date {
        let gregorian = Calendar.current
        let components = gregorian.dateComponents([.year, .month, .day], from: self)
        return gregorian.date(from: components)!
    }

    func isToday() -> Bool {
        let gregorian = Calendar.current
        return gregorian.isDateInToday(self)
    }

    func isYesterday() -> Bool {
        let gregorian = Calendar.current
        return gregorian.isDateInYesterday(self)
    }
    
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        var comp = DateComponents()
        comp.year = years
        comp.month = months
        comp.day = days
        comp.hour = hours
        comp.minute = minutes
        comp.second = seconds
        return Calendar.current.date(byAdding: comp, to: self)!
    }
}
