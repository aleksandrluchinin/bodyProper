//
//  ViewController.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 07.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //Создаю окно - иконку пользователя
    private var userFotoImageView: UIImageView {
        let imageView = UIImageView() //создаю иконку
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1) // выбираю цвет фона иконки color Literal
        imageView.layer.borderColor = UIColor.white.cgColor // делаю обводку инонки
        imageView.layer.borderWidth = 5 // делаю ширину обводки
        //imageView.layer.cornerRadius = 50 // скругляю углы до круга
        imageView.translatesAutoresizingMaskIntoConstraints = false // для  будущего создания констрейн
        
        return imageView
        
    }
    //создаю текст - имя пользователя
    private var userNameLabel: UILabel {
        let label = UILabel()
        label.text = "Ваше имя"
        label.adjustsFontSizeToFitWidth = true // свойство, чтобы весь текст мог поместился на экране
        label.minimumScaleFactor = 0.5 // сжатие текста
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    //создаю кнопку
    private var addWorkoutButton: UIButton {
        let button = UIButton(type: .system)//эффект отщелкивания кнопки
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)//текст на кнопке
        button.setImage(UIImage(named: "plus"), for: .normal)//изображение на кнопке
        button.backgroundColor = .specialDarkGreen
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 12)            //двигаю изобращение (+) вверх и вправо
        button.imageEdgeInsets = .init(top: 0,
                                       left: 20,
                                       bottom: 15,
                                       right: 0)
        //двигаю текст в кнопке
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)
        button.addShadowOnView()//тень кнопки
        // создаю метод нажатия на кнопку
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    // Создаю эксземпляр класс 
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    
    override func viewWillLayoutSubviews() {
        userFotoImageView.layer.cornerRadius = userFotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews() //1)вызываю метод при загрузке экрана
        setConstraints() // 2)вызываю метод создания констрэйнтов
        
    }
    
    private func setupViews(){ //настройки view
        view.backgroundColor = .specialBackground // создаю цвет основной родительной wiew
        view.addSubview(calendarView)// размещаю на экран calendar (вначале календарь, потом иконку)
        view.addSubview(userFotoImageView)// размещаю иконку пользователя на основной экран (wiew)
        view.addSubview(userNameLabel)//размещаю на экран имя пользователя
        view.addSubview(addWorkoutButton)// размещаю кнопку на основной view
        view.addSubview(weatherView)// размещаю на экран weatherView
        
    }
    // создаю метод нажатия на кнопку
    @objc private func addWorkoutButtonTapped() {
        print("нажатие на кнопку +")
    }
    
}

extension MainViewController { // расширяю класс методами
    
    private func setConstraints() { // метод создания констрэйнтов
        NSLayoutConstraint.activate([
            //устанавливаю верхнюю границу иконки пользователя
            userFotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            // устанавливаю левую границу
            userFotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //устанавливаю высоту и ширину иконки в 100 поинтов
            userFotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userFotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // устанавливаю констрэйнты для каленрдаря
            calendarView.topAnchor.constraint(equalTo: userFotoImageView.centerYAnchor),// верхня граница
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),//ширина
            // констрэйнты для label
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10), // делаю отступ от верхней границы календаря
            userNameLabel.leadingAnchor.constraint(equalTo: userFotoImageView.trailingAnchor, constant: 5),// отступ от иконки пользователя справа
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            
            // устанавливаю констрэйнты для кнопки
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            
            //устанавливаю констрэйнты для окна погоды
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 5),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
