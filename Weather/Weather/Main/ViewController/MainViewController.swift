//
//  MainViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var currentWeatherView: CurrentWeatherView!
    @IBOutlet weak var severalDaysWeatherTableView: UITableView!
    
    // - Presenter
    private(set) lazy var presenter: MainPresenter = MainPresenterImplementation(delegate: self)
    
    // - DataSource
    private var dataSource: MainDataSource?

    // - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.loadData()
    }

}

// MARK: - MainPresenterDelegate
extension MainViewController: MainPresenterDelegate {
    
    func updateUI(currentWeatherData: CurrentWeatherData?,
                  severalDaysWeatherData: SeveralDaysWeatherData?) {
        updateCurrentWeatherView(currentWeatherData: currentWeatherData)
        updateSeveralDaysWeatherTableView(severalDaysWeatherData: severalDaysWeatherData)
    }
    
}

// MARK: - Update
private extension MainViewController {
    
    func updateCurrentWeatherView(currentWeatherData: CurrentWeatherData?) {
        cityNameLabel.text = currentWeatherData?.city.name ?? ""
        weatherConditionLabel.text = ""
        if let weather = currentWeatherData?.weather {
//            weatherConditionLabel.text = weather.temp // "|"
        }
        currentWeatherView.set(data: currentWeatherData)
    }
    
    func updateSeveralDaysWeatherTableView(severalDaysWeatherData: SeveralDaysWeatherData?) {
        
    }
    
}

// MARK: - Configure
private extension MainViewController {
    
    func configure() {
        configureUI()
    }
    
    func configureUI() {
        cityNameLabel.font = UIFont(name: "Inter-Medium", size: 30)
        weatherConditionLabel.font = UIFont(name: "Inter-Medium", size: 16)
        weatherConditionLabel.textColor = .white.withAlphaComponent(0.6)
        currentWeatherView.layer.cornerRadius = 14
        severalDaysWeatherTableView.layer.cornerRadius = 14
        severalDaysWeatherTableView.backgroundColor = AppColor.darkGray
    }
    
}
