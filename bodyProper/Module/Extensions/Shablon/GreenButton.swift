//
//  GreenButton.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 18.11.2022.
//

import UIKit

class GreenButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        backgroundColor = .specialGreen
        titleLabel?.font = UIFont(name: "Roboto-Medium", size: 16)
        tintColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
