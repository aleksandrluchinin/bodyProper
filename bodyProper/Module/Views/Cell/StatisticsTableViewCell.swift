//
//  StatisticsTableViewCell.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 14.11.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    private var backgroundCell: UIView {
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
    
    private var beforeLabel: UILabel {
       let label = UILabel()
        label.text = "Before: 18"
        label.textColor = .specialBrown
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private var nowLabel: UILabel {
       let label = UILabel()
        label.text = "Now: 20"
        label.textColor = .specialBrown
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
        private var plusLabel: UILabel {
           let label = UILabel()
            label.text = "+4"
            label.textColor = .specialGreen
            label.font = .robotoMedium22()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
