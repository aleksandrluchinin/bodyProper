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
    private var segmentConrtol: UISegmentedControl {
        let segmentConrtol = UISegmentedControl(items: ["Неделя", "Месяц"])
        segmentConrtol.selectedSegmentIndex = 0
        segmentConrtol.backgroundColor = .specialGreen
        segmentConrtol.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentConrtol.setTitleTextAttributes([.font : font as Any,
                                               .foregroundColor : UIColor.white], for: .normal)
        segmentConrtol.setTitleTextAttributes([.font : font as Any,
                                               .foregroundColor : UIColor.specialGray], for: .selected)
        segmentConrtol.addTarget(self, action: #selector(segmentdChange), for: .valueChanged)
        segmentConrtol.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentConrtol
    }
    private var exercisesLabel = UILabel(text: "Exerciser")
//        let label = UILabel()
//        label.text = "Exercises"
//        label.font = UIFont(name: "Roboto-Medium", size: 14)
//        label.textColor = .specialBrown
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }
    
    private var tableView: UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.delaysContentTouches = false
        tableView.showsVerticalScrollIndicator = false
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
        view.addSubview(segmentConrtol)
        view.addSubview(statisticslabel)
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
        tableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: statisticIdTableViewCell)
    }
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc private func segmentdChange() {
       if segmentConrtol.selectedSegmentIndex == 0  {
            print("Неделя")
        } else {
            print("Месяц")
            
        }
    }
}

//MARK: - UITableViewDataSource

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
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
        
            statisticslabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            statisticslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentConrtol.topAnchor.constraint(equalTo: statisticslabel.bottomAnchor, constant: 20),
            segmentConrtol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentConrtol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticslabel.bottomAnchor, constant: 70),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        
        ])
    }
}

