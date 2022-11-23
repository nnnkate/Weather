//
//  WeatherModel.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct WeatherModel: Decodable {
    let city: String
    let temperature: String
    let description: String
    let currentWeather: [CurrentWeatherModel]
    let forecast: [DayWeatherModel]
    
    enum CodingKeys: String, CodingKey {
        case city
        case temperature
        case description
        case currentWeather = "weather_per_day"
        case forecast
    }
}

struct CurrentWeatherModel: Decodable {
    let timestamp: String
    let sunset: Bool?
    let weatherType: String
    let temperature: String

    enum CodingKeys: String, CodingKey {
        case timestamp
        case sunset
        case weatherType = "weather_type"
        case temperature
    }
}

struct DayWeatherModel: Decodable {
    let date: String
    let minTemperature: Int
    let maxTemperature: Int
    let weatherType: String

    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
}

