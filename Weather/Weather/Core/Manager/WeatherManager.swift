//
//  WeatherManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

protocol WeatherManager {
    func getWeatherData() -> WeatherModel?
}

final class WeatherManagerImplementation {
    
    let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = .init()) {
        self.jsonDecoder = jsonDecoder
    }
    
}

extension WeatherManagerImplementation: WeatherManager {
    
    func getWeatherData() -> WeatherModel? {
        if let path = Bundle.main.path(forResource: "WeatherData", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                return try? jsonDecoder.decode(WeatherModel.self, from: data)
            }
            return nil
        }
        return nil
    }
    
}
