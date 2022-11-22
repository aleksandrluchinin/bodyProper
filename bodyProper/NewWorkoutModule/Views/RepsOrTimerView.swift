//
//  RepsOrTimerView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 16.11.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private var setsLabel: UILabel {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var setsSlider: UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.maximumTrackTintColor = .specialBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(setSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
    private var fourLabel: UILabel {
        let label = UILabel()
        label.text = "4"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var chooseLabel = UILabel(text: "Chose repeat or timer")
    
    private var repsLabel: UILabel {
        let label = UILabel()
        label.text = "Reps"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var repsSlider: UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.maximumTrackTintColor = .specialBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
    private var tenLabel: UILabel {
        let label = UILabel()
        label.text = "10"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var timerLabel: UILabel {
        let label = UILabel()
        label.text = "Timer"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var secondLabel: UILabel {
        let label = UILabel()
        label.text = "1 min 30 sec"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var timerSlider: UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.maximumTrackTintColor = .specialBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
    
    public var isTimer = false
    
    public var isActive: Bool = true  {
        didSet {
            if self.isActive {
                secondLabel.alpha = 1
            } else {
                secondLabel.alpha = 0.5
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraint()
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        //
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(setsLabel)
        addSubview(setsSlider)
        addSubview(fourLabel)
        addSubview(chooseLabel)
        addSubview(repsLabel)
        addSubview(repsSlider)
        addSubview(tenLabel)
        addSubview(timerLabel)
        addSubview(secondLabel)
        addSubview(timerSlider)
        
    }
    
    @objc private func setSliderChanged() {
        fourLabel.text = "\(Int(setsSlider.value))"
    }
    @objc private func repsSliderChanged() {
        tenLabel.text = "\(Int(repsSlider.value))"
    }
    @objc private func timerSliderChanged() {
        let intValueSlider = Int(timerSlider.value)
        secondLabel.text = isTimer ? intValueSlider.getTimeFromSeconds() : "\(intValueSlider)"
    }
    
}
// MARK: - Set Constraint

extension RepsOrTimerView {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            setsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            setsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fourLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            fourLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            fourLabel.widthAnchor.constraint(equalToConstant: 50),
            
            setsSlider.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 20),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            chooseLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 20),
            chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            repsLabel.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 20),
            repsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            repsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tenLabel.topAnchor.constraint(equalTo: chooseLabel.topAnchor, constant: 20),
            tenLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tenLabel.widthAnchor.constraint(equalToConstant: 50),
            
            repsSlider.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 20),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            timerLabel.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            secondLabel.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            timerSlider.topAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 20),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
            
        ])
        
    }
}
