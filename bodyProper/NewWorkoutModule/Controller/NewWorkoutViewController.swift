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
    private var nameLabel = UILabel(text: "Name")
    private var repsLabel = UILabel(text: "Reps or timer")
    
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
    private var dateLabel = UILabel(text: "Date and repeat")
    
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
    
    //    private var mySlider: UISlider {
    //        let slider = UISlider()
    //       slider.minimumValue = 0
    //        slider.maximumValue = 10
    //        slider.maximumTrackTintColor = .specialLightBrown
    //        slider.minimumTrackTintColor = .specialGreen
    //        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    //
    //       slider.translatesAutoresizingMaskIntoConstraints = false
    //
    //        return slider
    //    }
    
    private let dateView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
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
        view.addSubview(dateView)
        view.addSubview(dateLabel)
        //        view.addSubview(datePicker)
        //        view.addSubview(mySwitch)
        //        view.addSubview(mySlider)
        view.addSubview(repsLabel)
        view.addSubview(repsOrTimerView)
        
    }
    @objc private func closeButtonTapped() {
        dismiss(animated: true) //закрытие экрана при нажатии на кнопку
    }
    @objc private func comutator() {
        print("1")
    }
    //    @objc private func sliderChanged() {
    //        print(mySlider.value)
    //    }
    
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
            
            
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dateView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3),
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dateView.heightAnchor.constraint(equalToConstant: 110),
            
            repsLabel.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 20),
            repsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            repsOrTimerView.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 5),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 330)
            //
            //            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            //            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //
            //            mySwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            //            mySwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //
            //            mySlider.topAnchor.constraint(equalTo: mySwitch.bottomAnchor, constant: 20),
            //            mySlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            mySlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


