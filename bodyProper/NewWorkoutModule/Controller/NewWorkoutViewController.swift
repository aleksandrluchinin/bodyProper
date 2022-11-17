//
//  NewWorkoutViewController.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 15.11.2022.
//


import UIKit

class NewWorkoutViewController: UIViewController {
    
    private var newWorkoutLabel = UILabel(textLabel: "NEW WORKOUT")
    
    private var closeButton: UIButton {
        let botton = UIButton(type: .system)
        botton.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)//изображение на всю кнопку
        botton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        botton.translatesAutoresizingMaskIntoConstraints = false
        return botton
    }
    private var nameTextField: UITextField {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.borderStyle = .none // рамка
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = UIFont(name: "Roboto-Medium", size: 20)
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15, height: 0))//отступ в графе
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }
    
    private var nameLabel = UILabel(text: "Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0 // делаю прозрачным рамку пикера
        
        
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(datePicker)
        view.addSubview(mySwitch)
        
    }
    @objc private func closeButtonTapped() {
        dismiss(animated: true) //закрытие экрана при нажатии на кнопку
    }
}

// MARK: - Set Constraint


extension NewWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mySwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            mySwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}


