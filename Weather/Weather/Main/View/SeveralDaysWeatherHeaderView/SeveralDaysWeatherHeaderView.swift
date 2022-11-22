//
//  SeveralDaysWeatherHeaderView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 22.11.22.
//

import UIKit

final class SeveralDaysWeatherHeaderView: UIView {
    
    // - UI
    private lazy var label = UILabel()
    private lazy var imageView = UIImageView(image: UIImage(named: "calendar"))
    
    // - Initialization
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
}

// MARK: - Configure
private extension SeveralDaysWeatherHeaderView {
    
    func configure() {
        addSubviews()
        configureUI()
        makeConstraints()
    }
    
    func configureUI() {
        imageView.tintColor = AppColor.gray
        label.text = "10-DAY FORECAST"
        label.textColor = AppColor.gray
        label.font = UIFont(name: "Inter-Medium", size: 14)
    }

    func addSubviews() {
        addSubview(label)
        addSubview(imageView)
    }
    
    func makeConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 14),
            imageView.heightAnchor.constraint(equalToConstant: 14),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 7)
        ])
    }
    
}

