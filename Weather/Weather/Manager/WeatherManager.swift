//
//  WeatherManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

protocol WeatherManager {
    func getCurrentWeatherData()
    func getSeveralDaysWeatherData()
}

final class WeatherManagerImplementation {
    
    let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = .init()) {
        self.jsonDecoder = jsonDecoder
    }
    
}

extension WeatherManagerImplementation: WeatherManager {
    
    func getCurrentWeatherData() {
        
    }
    
    func getSeveralDaysWeatherData() {
        
    }
    
}
