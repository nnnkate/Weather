//
//  CurrentWeatherDataSource.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.11.22.
//

import UIKit

final class CurrentWeatherDataSource: NSObject {
    
    private unowned let collectionView: UICollectionView
    
    // - Data
    private var data: [HourWeatherData] = []
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configure()
    }
    
    func set(data: [HourWeatherData]) {
        self.data = data
        collectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDataSource
extension CurrentWeatherDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.reuseID, for: indexPath) as! HourWeatherCell
        cell.backgroundColor = .yellow
//        cell.set(section: sections[indexPath.item])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension CurrentWeatherDataSource: UICollectionViewDelegate {
    
}

// MARK: - Layout
extension CurrentWeatherDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 51, height: 90)
    }
    
}

// MARK: - Configure
private extension CurrentWeatherDataSource {
    
    func configure() {
        configureCollectionViewLayout()
        setupDataSource()
        registerCells()
    }
    
    func configureCollectionViewLayout(sidePadding: CGFloat = 16, betweenSpace: CGFloat = 33) {
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = .init(top: 0, left: sidePadding, bottom: 0, right: sidePadding)
        collectionViewLayout?.minimumInteritemSpacing = betweenSpace
        collectionViewLayout?.minimumLineSpacing = 0
        collectionViewLayout?.invalidateLayout()
    }
    
    func setupDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func registerCells() {
        collectionView.register(HourWeatherCell.nib(), forCellWithReuseIdentifier: HourWeatherCell.reuseID)
    }
    
}



