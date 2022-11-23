//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 22.11.22.
//

import UIKit

struct CurrentWeatherData {
    let city: String
    let temperature: String
    let description: String
    let currentWeather: [HourWeatherData]
    
    static func convertFromDto(dto: WeatherModel?) -> CurrentWeatherData {
        let data = CurrentWeatherData(city: dto?.city ?? "",
                                      temperature: dto?.temperature ?? "",
                                      description: dto?.description ?? "",
                                      currentWeather: dto?.currentWeather.map { HourWeatherData.convertFromDto(dto: $0) } ?? [])
        return data
    }
}

struct HourWeatherData {
    let timestamp: String
    let sunset: Bool
    let weatherType: WeatherType?
    let temperature: String
    
    static func convertFromDto(dto: CurrentWeatherModel?) -> HourWeatherData {
        let data = HourWeatherData(timestamp: dto?.timestamp ?? "",
                                   sunset: dto?.sunset ?? false,
                                   weatherType: WeatherType(rawValue: dto?.weatherType ?? ""),
                                   temperature: dto?.temperature ?? "")
        return data
    }
}
