//
//  Date+Extension.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.11.22.
//

import Foundation

extension Date {
    
    func getWeekday() -> String {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        if self == currentDate {
            return "Сегодня"
        }
        let weekdayNumber = calendar.component(.weekday, from: self)
        switch weekdayNumber {
        case 1: return "Вс"
        case 2: return "Пн"
        case 3: return "Вт"
        case 4: return "Ср"
        case 5: return "Чт"
        case 6: return "Пт"
        case 7: return "Сб"
        default: return ""
        }
    }
    
}
