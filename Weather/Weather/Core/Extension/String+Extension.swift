//
//  String+Extension.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.11.22.
//

import Foundation

extension String {
    
    var standartDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    
}
