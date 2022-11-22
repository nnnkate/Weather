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
        configureUI()
    }
        
}

// MARK: - Configure
private extension DayWeatherCell {
    
    func configure() {
        configureUI()
    }
    
    func configureUI() {
        guard let data else {
            dayLabel.text = ""
            
            minTemperatureLabel.text = ""
            maxTemperatureLabel.text = ""
            return }
        dayLabel.text = data.date
        
        minTemperatureLabel.text = String(data.minTemperature)
        maxTemperatureLabel.text = String(data.maxTemperature)
    }
    
}
