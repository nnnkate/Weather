//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

struct CurrentWeatherModel: Decodable {
    let city: CityModel
    let weather: [WeatherModel]
    let sunrise: String
    let sunset: String
}

struct WeatherModel: Decodable {
    let temp: Int
    let condition: String
    let description: String
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case temp, condition, description
        case dtTxt = "dt_txt"
    }
}

