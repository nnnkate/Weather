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
    
    static func convertFromDto(dto: WeatherModel?) -> CurrentWeatherData {
        let data = CurrentWeatherData(city: dto?.city ?? "",
                                      temperature: dto?.temperature ?? "",
                                      description: dto?.description ?? "")
        return data
    }
}

