//
//  NewWorkoutViewController.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 15.11.2022.
//


import UIKit

class NewWorkoutViewController: UIViewController {
    
    private var newWorkoutLabel = UILabel(textLabel: "NEW WORKOUT")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        
    }
    
}

// MARK: - Set Constraint


extension NewWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
}


