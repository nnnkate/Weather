//
//  MainViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    // - UI
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var weatherConditionLabel: UILabel!
    @IBOutlet private weak var currentWeatherView: CurrentWeatherView!
    @IBOutlet private weak var severalDaysWeatherTableView: UITableView!
    
    // - Presenter
    private(set) lazy var presenter: MainPresenter = MainPresenterImplementation(delegate: self)
    
    // - DataSource
    private var severalDaysWeatherDataSource: SeveralDaysWeatherDataSource?

    // - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.loadData()
    }

}

// MARK: - MainPresenterDelegate
extension MainViewController: MainPresenterDelegate {
    
    func updateData(currentWeatherData: CurrentWeatherData?,
                    severalDaysWeatherData: SeveralDaysWeatherData?) {
        updateCurrentWeatherView(currentWeatherData: currentWeatherData)
        severalDaysWeatherDataSource?.set(data: severalDaysWeatherData?.list ?? [])
    }
    
}

// MARK: - Update
private extension MainViewController {
    
    func updateCurrentWeatherView(currentWeatherData: CurrentWeatherData?) {
        cityNameLabel.text = currentWeatherData?.city
        weatherConditionLabel.text = currentWeatherData?.temperature ?? ""
//        if let weather = currentWeatherData?.weather {
//            weatherConditionLabel.text = weather.temp // "|"
//        }
        currentWeatherView.set(title: currentWeatherData?.description ?? "",
                               data: currentWeatherData?.currentWeather ?? [])
    }
    
    
    
}

// MARK: - Configure
private extension MainViewController {
    
    func configure() {
        configureUI()
        configureDataSource()
    }
    
    func configureUI() {
        cityNameLabel.font = UIFont(name: "Inter-Medium", size: 30)
        weatherConditionLabel.font = UIFont(name: "Inter-Medium", size: 16)
        weatherConditionLabel.textColor = .white.withAlphaComponent(0.6)
        currentWeatherView.layer.cornerRadius = 14
        severalDaysWeatherTableView.layer.cornerRadius = 14
        severalDaysWeatherTableView.backgroundColor = AppColor.darkGray.withAlphaComponent(0.6)
        severalDaysWeatherTableView.showsVerticalScrollIndicator = false
    }
    
    func configureDataSource() {
        severalDaysWeatherDataSource = SeveralDaysWeatherDataSource(tableView: severalDaysWeatherTableView)
    }
    
}
