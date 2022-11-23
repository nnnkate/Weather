//
//  HourWeatherCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.11.22.
//

import UIKit

class HourWeatherCell: UICollectionViewCell {
    
    // - UI
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // - Register Cell
    static let reuseID = "HourWeatherCell"
    static func nib() -> UINib {
        return UINib(nibName: "HourWeatherCell",
                     bundle: nil)
    }
    
    // - Data
    private(set) var data: HourWeatherData?

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func set(data: HourWeatherData) {
        self.data = data
        updateData()
    }

}

// MARK: - Update
private extension HourWeatherCell {
    
    func updateData() {
        guard let data else {
            hourLabel.text = ""
            conditionImageView.image = UIImage()
            temperatureLabel.text = ""
            return }
        hourLabel.text = data.timestamp
        let weatherType = data.weatherType
        conditionImageView.image = weatherType?.image
        temperatureLabel.text = data.temperature
    }
    
}

// MARK: - Configure
private extension HourWeatherCell {
    
    func configure() {
        configureUI()
    }
    
    func configureUI() {
        hourLabel.textColor = .white
        hourLabel.font = UIFont(name: "Inter-Medium", size: 14)
        hourLabel.textAlignment = .center
        conditionImageView.tintColor = .white
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont(name: "Inter-Medium", size: 16)
        temperatureLabel.textAlignment = .center
    }
}
