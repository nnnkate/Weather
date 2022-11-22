//
//  SeveralDaysWeatherData.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 22.11.22.
//

import UIKit

struct SeveralDaysWeatherData {
    let list: [DayWeatherData]
    
    static func convertFromDto(dto: WeatherModel?) -> SeveralDaysWeatherData {
        let data = SeveralDaysWeatherData(list: dto?.forecast.map { DayWeatherData.convertFromDto(dto: $0) } ?? [])
        return data
    }
    
}

struct DayWeatherData {
    let date: String
    let minTemperature: Int
    let maxTemperature: Int
    let weatherType: String
    
    static func convertFromDto(dto: DayWeatherModel?) -> DayWeatherData {
        let data = DayWeatherData(date: dto?.date ?? "",
                                      minTemperature: dto?.minTemperature ?? 0,
                                      maxTemperature: dto?.minTemperature ?? 0,
                                      weatherType: dto?.weatherType ?? "")
        return data
    }
}
