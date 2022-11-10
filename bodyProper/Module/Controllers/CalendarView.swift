//
//  CalendarView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 08.11.2022.
//

import UIKit

class CalendarView: UIView {
    
    
    
    override init(frame: CGRect) { //создаю инициализатор класса CalendarView
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CalendarView {
    
    private func setConstraint() {
        
    }
}
