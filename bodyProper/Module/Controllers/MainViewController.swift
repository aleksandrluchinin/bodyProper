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
    //создаю label для отбражения тренировок
    private var workoutTodaylabel: UILabel {
        let label = UILabel()
        label.text = "Workout Today"
        label.textColor = .specialLightBrown
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    //создаю таблицу
    private var tableView: UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none //разделение между ячейками
        tableView.bounces = false //чтобы таблица не оттягивалась
        tableView.showsVerticalScrollIndicator = false //отключение скроллинга
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }
    private let idTableViewCell = "idTableViewCell" //индентификтор ячейки
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
        setDelegates()// метод передачи данных
    }
    private func setupViews(){ //настройки view
        view.backgroundColor = .specialBackground // создаю цвет основной родительной wiew
        view.addSubview(calendarView)// размещаю на экран calendar (вначале календарь, потом иконку)
        view.addSubview(userFotoImageView)// размещаю иконку пользователя на основной экран (wiew)
        view.addSubview(userNameLabel)//размещаю на экран имя пользователя
        view.addSubview(addWorkoutButton)// размещаю кнопку на основной view
        view.addSubview(weatherView)// размещаю на экран weatherView
        view.addSubview(workoutTodaylabel)// размещаю лейбл текст
        view.addSubview(tableView)//размещаю таблицу
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idTableViewCell)//регистрирую ячейку
        
    }
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // создаю метод нажатия на кнопку
    @objc private func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutViewController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen // открытие контролера на весь экран
        newWorkoutViewController.modalTransitionStyle = .coverVertical // отображение анимации
        present(newWorkoutViewController, animated: true)// переход между контролеерами
    }
    
}
//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    //количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    //создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? WorkoutTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
//MARK - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    // высота ячейки в поинтах (по умолчанию 40)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
//MARK - Set Constraints

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
            
            // устанавливаю констрэйнты для календаря
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
            weatherView.heightAnchor.constraint(equalToConstant: 100),
            
            workoutTodaylabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodaylabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: workoutTodaylabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
