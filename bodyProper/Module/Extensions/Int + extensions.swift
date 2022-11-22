//
//  Int + extensions.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 22.11.2022.
//

import Foundation

extension Int {
    
  func getTimeFromSeconds() -> String {
        "\(self / 60) min \(self % 60) sec"
    }
}

