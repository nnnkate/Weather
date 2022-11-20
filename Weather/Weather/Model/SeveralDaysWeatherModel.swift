//
//  DailyForecastSeveralDaysModel.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct SeveralDaysWeatherModel: Decodable {
    let city: CityModel
    let list: [DayWeatherModel]
}

struct CityModel: Decodable {
    let id: Int
    let name: String
}

// MARK: - List
struct DayWeatherModel: Decodable {
    let temp: TemperatureModel
    let humidity: Int
    let condition: String
}

struct TemperatureModel: Decodable {
    let min: Int
    let max: Int
}

