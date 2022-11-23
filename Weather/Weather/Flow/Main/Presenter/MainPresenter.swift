//
//  MainPresenter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import Foundation

protocol MainPresenter {
    func loadData()
}

protocol MainPresenterDelegate: AnyObject {
    func updateData(currentWeatherData: CurrentWeatherData?,
                    severalDaysWeatherData: SeveralDaysWeatherData?)
}

final class MainPresenterImplementation {
    
    // - Data
    private lazy var weatherManager: WeatherManager = WeatherManagerImplementation()
    private var currentWeatherData: CurrentWeatherData?
    private var severalDaysWeatherData: SeveralDaysWeatherData?
    
    // - Delegate
    private weak var delegate: MainPresenterDelegate?
    
    init(delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
}

extension MainPresenterImplementation: MainPresenter {
    
    func loadData() {
        let weatherData = weatherManager.getWeatherData()
        currentWeatherData = weatherData.map { CurrentWeatherData.convertFromDto(dto: $0) }
        severalDaysWeatherData = weatherData.map { SeveralDaysWeatherData.convertFromDto(dto: $0) }
        delegate?.updateData(currentWeatherData: currentWeatherData,
                             severalDaysWeatherData: severalDaysWeatherData)
    }
    
}
