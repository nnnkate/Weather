//
//  DayWeatherCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 22.11.22.
//

import UIKit

class DayWeatherCell: UITableViewCell {
    
    // - UI
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    // - Register Cell
    static let reuseID = "DayWeatherCell"
    static func nib() -> UINib {
        return UINib(nibName: "DayWeatherCell",
                     bundle: nil)
    }
    
    // - Data
    private(set) var data: DayWeatherData?

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func set(data: DayWeatherData) {
        self.data = data
        updateData()
    }
        
}

// MARK: - Update
private extension DayWeatherCell {
    
    func updateData() {
        guard let data else {
            dayLabel.text = ""
            conditionImageView.image = UIImage()
            minTemperatureLabel.text = ""
            maxTemperatureLabel.text = ""
            return }
        dayLabel.text = data.date
        let weatherType = WeatherType(rawValue: data.weatherType)
        conditionImageView.image = weatherType?.image
        conditionLabel.isHidden = weatherType != .snow
        conditionLabel.text = weatherType == .snow ? "70 %" : ""
        minTemperatureLabel.text = String(data.minTemperature)
        maxTemperatureLabel.text = String(data.maxTemperature)
    }
    
}

// MARK: - Configure
private extension DayWeatherCell {
    
    func configure() {
        configureUI()
    }
    
    func configureUI() {
        dayLabel.textColor = .white
        dayLabel.font = UIFont(name: "Inter-Medium", size: 18)
        conditionImageView.tintColor = .white
        conditionLabel.textColor = AppColor.lightBlue
        conditionLabel.font = UIFont(name: "Inter-Medium", size: 11)
        minTemperatureLabel.textColor = AppColor.gray
        minTemperatureLabel.font = UIFont(name: "Inter-Medium", size: 16)
        maxTemperatureLabel.textColor = .white
        maxTemperatureLabel.font = UIFont(name: "Inter-Medium", size: 16)
    }
    
}
