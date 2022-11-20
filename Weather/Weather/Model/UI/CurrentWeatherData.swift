//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct CurrentWeatherData {
    let city: CityData
    let weather: [WeatherData]
    let sunrise: String
    let sunset: String
        
    static func convertFromDto(dto: CurrentWeatherModel) -> CurrentWeatherData {
        let city = dto.city
        let weather = dto.weather.map { WeatherData.convertFromDto(dto: $0) }
        let data = CurrentWeatherData(city: CityData(id: city.id, name: city.name),
                                      weather: weather,
                                      sunrise: dto.sunrise,
                                      sunset: dto.sunset)
        return data
    }
    
}

struct WeatherData {
    let temp: Int
    let condition: String
    let description: String
    let dtTxt: String
    
    static func convertFromDto(dto: WeatherModel) -> WeatherData {
         WeatherData(temp: dto.temp,
                     condition: dto.condition,
                     description: dto.description,
                     dtTxt: dto.dtTxt)
    }
}

