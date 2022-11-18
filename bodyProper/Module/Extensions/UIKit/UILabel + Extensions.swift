//
//  UILabel + Extensions.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 15.11.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.font = UIFont(name: "Roboto-Medium", size: 14)
        self.textColor = .specialLightBrown
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
extension UILabel {
    convenience init(textLabel: String = "") {
        self.init()
        self.text = textLabel
        self.font = UIFont(name: "Roboto-Medium", size: 24)
        self.textColor = .specialGray
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
