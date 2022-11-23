//
//  SeveralDaysWeatherDataSource.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import UIKit

final class SeveralDaysWeatherDataSource: NSObject {
    
    private unowned let tableView: UITableView
    
    // - Data
    private var data: [DayWeatherData] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configure()
    }
    
    func set(data: [DayWeatherData]) {
        self.data = data
        tableView.reloadData()
    }
    
}

// MARK: - Cell
private extension SeveralDaysWeatherDataSource {
    
    func dayWeatherCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayWeatherCell.reuseID, for: indexPath) as! DayWeatherCell
        cell.set(data: data[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDataSource
extension SeveralDaysWeatherDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dayWeatherCell(cellForRowAt: indexPath)
    }
    
}

// MARK: - UITableViewDelegate
extension SeveralDaysWeatherDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        47
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        SeveralDaysWeatherHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        45
    }
    
}


// MARK: - Configure
private extension SeveralDaysWeatherDataSource {
    
    func configure() {
        tableView.rowHeight = UITableView.automaticDimension
        registerCells()
        setupDataSource()
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    func setupDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCells() {
        tableView.register(DayWeatherCell.nib(), forCellReuseIdentifier: DayWeatherCell.reuseID)
    }
    
}
