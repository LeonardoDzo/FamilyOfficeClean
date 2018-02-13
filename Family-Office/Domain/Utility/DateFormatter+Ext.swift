//
//  DateFormatter+ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
extension DateFormatter {
    
    @nonobjc static let HHmm: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    
    @nonobjc static let Hmma: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm a"
        return formatter
    }()
    
    @nonobjc static let localeMediumStyle: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            formatter.locale = Locale(identifier: countryCode)
        }
        return formatter
    }()
    
    @nonobjc static let InternationalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd yyyy HH:mm"
        return formatter
    }()
    
    @nonobjc static let ShortInternationalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd yyyy"
        return formatter
    }()
    
    @nonobjc static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy")
        return formatter
    }()
    @nonobjc static let month: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM")
        return formatter
    }()
    
    @nonobjc static let MMyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MM yyyy")
        return formatter
    }()
    
    @nonobjc static let ddMMMyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        return formatter
    }()
    @nonobjc static let MMMddHHmm: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM. dd, HH:mm")
        return formatter
    }()
    @nonobjc static let MMMyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM-yyyy")
        return formatter
    }()
    @nonobjc static let MMddyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MM dd yyyy")
        return formatter
    }()
}
