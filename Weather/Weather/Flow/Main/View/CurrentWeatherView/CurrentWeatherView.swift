//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import UIKit

final class CurrentWeatherView: UIView {
    
    private lazy var conditionLabel = UILabel()
    private lazy var separator = UIView()
    private lazy var collectionView = UICollectionView()
    
    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func set(data: CurrentWeatherData?) {
        conditionLabel.text = data?.description
    }
    
}

// MARK: - Configure
private extension CurrentWeatherView {
   
    func configure() {
        configureUI()
        addSubviews()
        makeConstraints()
    }
    
    func configureUI() {
        self.backgroundColor = .darkGray.withAlphaComponent(0.6)
        conditionLabel.font = UIFont(name: "Inter-Medium", size: 14)
        conditionLabel.textColor = .white
        conditionLabel.numberOfLines = 0
        self.backgroundColor = AppColor.darkGray.withAlphaComponent(0.6)
        separator.backgroundColor = AppColor.separator
        
    }
    
    func addSubviews() {
        addSubview(conditionLabel)
        addSubview(separator)
    }
    
    func makeConstraints() {
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            conditionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            conditionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            conditionLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -14)
        ])
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 14),
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
