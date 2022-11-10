//
//  UIView + Extensions.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 09.11.2022.
//

import UIKit

extension UIView {
    //делаю тени
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)//смещение тени
        layer.shadowOpacity = 0.7 // прозрачность тени
        layer.shadowRadius = 1
        
    }
}
