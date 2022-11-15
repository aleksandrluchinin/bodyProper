//
//  StatisticViewController.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 14.11.2022.
//

import UIKit

class StatisticViewController: UIViewController {

    
    private var statisticslabel: UILabel {
        let label = UILabel()
        label.text = "STATISTICS"
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }
    private var exercisesLabel: UILabel {
        let label = UILabel()
        label.text = "Exercises"
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.textColor = .specialBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private var tableView: UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }
    private let statisticIdTableViewCell = "statisticIdTableViewCell"
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(statisticslabel)
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
        tableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: statisticIdTableViewCell)
    }
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - UITableViewDataSource

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: statisticIdTableViewCell, for: indexPath) as? StatisticsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
 
    
}
// MARK: - UITableViewDelegate

extension StatisticViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
// MARK: - Set Constraint


    extension StatisticViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            statisticslabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            statisticslabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticslabel.bottomAnchor, constant: 70),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        
        ])
    }
}

