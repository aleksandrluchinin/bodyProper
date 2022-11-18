//
//  DateAndRepeatView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 16.11.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private var dateLabel: UILabel {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private var textLabel: UILabel {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        //        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var datePicker: UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }
    private var mySwitch: UISwitch {
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        mySwitch.onTintColor = .specialGreen
        mySwitch.addTarget(self, action: #selector(comutator), for: .valueChanged)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }
    //создаю инициализатор класса
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraint()
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0 // делаю прозрачным рамку пикера
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        //        addShadowOnView()// тень
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dateLabel)
        addSubview(datePicker)
        addSubview(textLabel)
        addSubview(mySwitch)
        
    }
    @objc private func comutator() {
        print("1")
    }
    
}
// MARK: - Set Constraint

extension DateAndRepeatView {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: 20),
            
            textLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            
            datePicker.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            mySwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            mySwitch.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
            mySwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mySwitch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
        
    }
}

