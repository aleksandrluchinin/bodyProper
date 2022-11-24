//
//  StartWorkout.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 23.11.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private var startWorkoutLabel = UILabel(textLabel: "START WORKOUT")
    
    private let closeButton = CloseButton(type: .system)
    
    private var userImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "woman")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    private var exercisesLabel = UILabel(text: "Details")
    
    private let startWorkoutView = StartWorkoutView()
    
    private var saveButton = GreenButton(text: "FINISH")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(userImageView)
        view.addSubview(exercisesLabel)
        view.addSubview(startWorkoutView)
        view.addSubview(saveButton)
    }
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
}
// MARK: - Set Constraint

extension StartWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            userImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            
            exercisesLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            startWorkoutView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 5),
            startWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            startWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            startWorkoutView.heightAnchor.constraint(equalToConstant: 330),
            
            saveButton.topAnchor.constraint(equalTo: startWorkoutView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
    
}
