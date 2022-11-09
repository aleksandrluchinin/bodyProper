//
//  WeatherView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 08.11.2022.
//

import UIKit

class WeatherView: UIView {
    
   
    
    private var sunImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
       
        return imageView
    }
    
    private var weatherLabel: UILabel {
        let label = UILabel()
        label.text = "Солнечно"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private var weatherTextLabel: UILabel {
        let label = UILabel()
        label.text = "Хорошая погода чтобы позаниматься"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }
    //создаю инициализатор класса
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sunImageView)// добавляю солнце на экран weatherView
        addSubview(weatherLabel)
        addSubview(weatherTextLabel)
        
    }
    
}
extension WeatherView {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            sunImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sunImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sunImageView.heightAnchor.constraint(equalToConstant: 60),
            sunImageView.widthAnchor.constraint(equalToConstant: 60),
            
            //констрейнты для label
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.trailingAnchor.constraint(equalTo: sunImageView.leadingAnchor, constant: -10),
            weatherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherTextLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 0),
            weatherTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherTextLabel.trailingAnchor.constraint(equalTo: sunImageView.leadingAnchor, constant: -5)
            
        ])
        
    }
}
