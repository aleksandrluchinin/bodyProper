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
        backgroundColor = #colorLiteral(red: 0.2, green: 0.5529411765, blue: 0.4901960784, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CalendarView {
    
    private func setConstraint() {
        
    }
}
