//
//  HourWeatherCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.11.22.
//

import UIKit

class HourWeatherCell: UICollectionViewCell {
    
    // - Register Cell
    static let reuseID = "HourWeatherCell"
    static func nib() -> UINib {
        return UINib(nibName: "HourWeatherCell",
                     bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
