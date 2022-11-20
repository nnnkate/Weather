//
//  SeveralDaysWeatherData.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct SeveralDaysWeatherData: Decodable {
    let city: CityData
    let list: [DayWeatherData]
    
    static func convertFromDto(dto: SeveralDaysWeatherModel) -> SeveralDaysWeatherData {
        let city = dto.city
        let list = dto.list.map { DayWeatherData.convertFromDto(dto: $0) }
        let data = SeveralDaysWeatherData(city: CityData(id: city.id, name: city.name),
                                          list: list)
        return data
    }
    
}

struct CityData: Decodable {
    let id: Int
    let name: String
}

struct DayWeatherData: Decodable {
    let temp: TemperatureData
    let humidity: Int
    let condition: String
    
    static func convertFromDto(dto: DayWeatherModel) -> DayWeatherData {
        DayWeatherData(temp: TemperatureData(min: dto.temp.min,
                                             max: dto.temp.max),
                       humidity: dto.humidity,
                       condition: dto.condition)
    }
}

struct TemperatureData: Decodable {
    let min: Int
    let max: Int
}
