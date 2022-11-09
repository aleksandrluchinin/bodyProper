//
//  WeatherView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 08.11.2022.
//

import UIKit

class WeatherView: UIView {
    
    let sunImage = UIImage(named: "sun")
    
    private var sunImageView: UIImageView {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = sunImage
        return imageView
    }
    
    private var weatherLabel: UILabel {
        let label = UILabel()
        label.text = "Солнечно"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private var weatherTextLabel: UILabel {
        let label = UILabel()
        label.text = "Хорошая погода чтобы позаниматься"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
        
    }
    
}
extension WeatherView {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            sunImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sunImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sunImageView.heightAnchor.constraint(equalToConstant: 40),
            sunImageView.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
}
