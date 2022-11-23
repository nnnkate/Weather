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
    
    private var currentWeatherDataSource: CurrentWeatherDataSource?
    
    private var data: [HourWeatherData] = []

    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func set(title: String, data: [HourWeatherData]) {
        conditionLabel.text = title
        currentWeatherDataSource?.set(data: data)
    }
    
}

// MARK: - Configure
private extension CurrentWeatherView {
   
    func configure() {
        setupCollectionView()
        configureDataSource()
        configureUI()
        addSubviews()
        makeConstraints()
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.itemSize = CGSize(width: 90, height: 40)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.masksToBounds = false
    }
    
    func configureDataSource() {
        currentWeatherDataSource = CurrentWeatherDataSource(collectionView: collectionView)
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
        addSubview(collectionView)
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
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: separator.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:  self.bottomAnchor)
        ])
    }
    
}
