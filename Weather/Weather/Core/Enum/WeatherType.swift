//
//  WeatherType.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 22.11.22.
//

import UIKit

enum WeatherType: String {
    case clouds
    case snow
    
    var image: UIImage? {
        switch self {
        case .clouds:
            return UIImage(named: "clouds")
        case .snow:
            return UIImage(named: "snow")
        }
    }
}
