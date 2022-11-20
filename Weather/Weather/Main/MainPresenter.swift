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
    func updateUI()
}

final class MainPresenterImplementation {
    
    // - Data
    private lazy var weatherManager: WeatherManager = WeatherManagerImplementation()
    
    // - Delegate
    private weak var delegate: MainPresenterDelegate?
    
    init(delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
}

extension MainPresenterImplementation: MainPresenter {
    
    func loadData() {
        
    }
    
}
