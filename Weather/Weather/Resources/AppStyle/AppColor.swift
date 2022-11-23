//
//  AppColor.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.11.22.
//

import UIKit

enum AppColor {
    static let lightBlue = color(fromHex: "8BCCE7")
    static let gray = color(fromHex: "95A1B1")
    static let darkGray = color(fromHex: "3C4E65")
    static let separator = color(fromHex: "6E7887")
}

// MARK: - Calculate color
extension AppColor {
    static func color(fromHex hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: alpha
        )
    }
    
    static func colorFromRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255,
                       green: green / 255,
                       blue: blue / 255,
                       alpha: alpha)
    }
}
