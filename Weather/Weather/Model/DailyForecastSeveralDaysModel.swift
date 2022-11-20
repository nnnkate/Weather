//
//  DailyForecastSeveralDaysModel.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct DailyForecastSeveralDaysModel: Decodable {
    let city: CityModel
    let list: [DailyForecastModel]
}

struct CityModel: Decodable {
    let id: Int
    let name: String
}

// MARK: - List
struct DailyForecastModel: Decodable {
    let temp: TempModel
    let humidity: Int
    let condition: String
}

struct TempModel: Decodable {
    let min: Int
    let max: Int
}

