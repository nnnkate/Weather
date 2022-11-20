//
//  WeatherManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

protocol WeatherManager {
    func getCurrentWeatherData() -> CurrentWeatherModel?
    func getSeveralDaysWeatherData() -> SeveralDaysWeatherModel?
}

final class WeatherManagerImplementation {
    
    let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = .init()) {
        self.jsonDecoder = jsonDecoder
    }
    
}

extension WeatherManagerImplementation: WeatherManager {
    
    func getCurrentWeatherData() -> CurrentWeatherModel? {
        if let path = Bundle.main.path(forResource: "CurrentWeather", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                return try? jsonDecoder.decode(CurrentWeatherModel.self, from: data)
            }
            return nil
        }
        return nil
    }
    
    func getSeveralDaysWeatherData() -> SeveralDaysWeatherModel? {
        if let path = Bundle.main.path(forResource: "SeveralDaysWeather", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                return try? jsonDecoder.decode(SeveralDaysWeatherModel.self, from: data)
            }
            return nil
        }
        return nil
    }
    
}
