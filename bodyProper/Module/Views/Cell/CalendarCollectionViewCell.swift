//
//  CalendarCollectionViewCell.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 09.11.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    //создаю в ячейке 2 label, с реагированием на нажатие в колекции
    private var dayOfWeekLabel: UILabel {
        let label = UILabel()
        label.text = "We"
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    private var numberOfdayLabel: UILabel {
        let label = UILabel()
        label.text = "07"
        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // переопределяю метод для выделения ячеек с изменением цвета
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfdayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfdayLabel.textColor = .white
            }
        }
    }
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfdayLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            
            numberOfdayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfdayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
        
        
        ])
    }
}
