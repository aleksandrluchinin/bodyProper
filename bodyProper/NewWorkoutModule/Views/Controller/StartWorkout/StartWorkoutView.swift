//
//  StartWorkoutView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 23.11.2022.
//

import UIKit

class StartWorkoutView: UIView {
    
    private var bicepsLabel: UILabel {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var setsLabel: UILabel {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var fourLabel: UILabel {
        let label = UILabel()
        label.text = "1/4"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private var repssLabel: UILabel {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var twentyLabel: UILabel {
        let label = UILabel()
        label.text = "20"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private var editingButton: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .none
        button.setTitle("Editind", for: .normal)
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.backgroundColor = .specialLightBrown
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 12)
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    private var nextSetButton: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.setTitle("NEXT SET", for: .normal)
        button.backgroundColor = .specialLightBrown
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 24)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(bicepsLabel)
        addSubview(setsLabel)
        addSubview(fourLabel)
        addSubview(repssLabel)
        addSubview(twentyLabel)
        addSubview(editingButton)
        addSubview(nextSetButton)
        
    }
    @objc private func editingButtonTapped() {
        print(editingButtonTapped)
    }
    @objc private func nextButtonTapped() {
        print(nextButtonTapped)
    }
}

// MARK: - Set Constraint

extension StartWorkoutView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            bicepsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            bicepsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            setsLabel.topAnchor.constraint(equalTo: bicepsLabel.bottomAnchor, constant: 20),
            setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            setsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fourLabel.topAnchor.constraint(equalTo: bicepsLabel.bottomAnchor, constant: 20),
            fourLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            fourLabel.widthAnchor.constraint(equalToConstant: 50),
            
            repssLabel.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 20),
            repssLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            repssLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            twentyLabel.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 20),
            twentyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            twentyLabel.widthAnchor.constraint(equalToConstant: 50),
            
            editingButton.topAnchor.constraint(equalTo: twentyLabel.bottomAnchor, constant: 20),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            editingButton.heightAnchor.constraint(equalToConstant: 33),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 20),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            nextSetButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}


