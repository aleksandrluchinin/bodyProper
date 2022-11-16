//
//  StatisticsTableViewCell.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 14.11.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    private var staticsBackgroundCell: UIView {
       let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }
    
    private var bicepsNameLabel: UILabel {
       let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialBlack
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private var beforeLabel = UILabel(text: "Before: 18")
//       let label = UILabel()
//        label.text = "Before: 18"
//        label.textColor = .specialBrown
//        label.font = .robotoMedium16()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
    
    
    private var nowLabel = UILabel(text: "Now: 20")
//       let label = UILabel()
//        label.text = "Now: 20"
//        label.textColor = .specialBrown
//        label.font = .robotoMedium16()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
    
    private var lineView: UIView {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    
        private var plusLabel: UILabel {
           let label = UILabel()
            label.text = "+4"
            label.textColor = .specialGreen
            label.font = .robotoMedium24()
            label.textAlignment = .right
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        var labelStakView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(staticsBackgroundCell)
        addSubview(bicepsNameLabel)
        addSubview(beforeLabel)
        addSubview(nowLabel)
        addSubview(plusLabel)
        
        labelStakView = UIStackView(arrangedSubviews: [beforeLabel, nowLabel], spacing: 10)
        addSubview(labelStakView)
        addSubview(lineView)
      
    }

}
extension StatisticsTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            staticsBackgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            staticsBackgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            staticsBackgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            staticsBackgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            bicepsNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bicepsNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bicepsNameLabel.trailingAnchor.constraint(equalTo: plusLabel.leadingAnchor, constant: -20),
            
            labelStakView.topAnchor.constraint(equalTo: bicepsNameLabel.bottomAnchor, constant: 0),
            labelStakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelStakView.heightAnchor.constraint(equalToConstant: 20),
            
            plusLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            plusLabel.widthAnchor.constraint(equalToConstant: 50),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        
        ])
    }
}
