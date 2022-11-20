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
    @IBOutlet weak var currentWeatherView: UIView!
    @IBOutlet weak var SeveralDaysWeatherTableView: UITableView!
    
    // - Presenter
    private(set) lazy var presenter: MainPresenter = MainPresenterImplementation(delegate: self)

    // - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.loadData()
    }

}

// MARK: - MainPresenterDelegate
extension MainViewController: MainPresenterDelegate {
    
    func updateUI() {
        
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
    }
    
}
