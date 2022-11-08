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
        imageView.layer.cornerRadius = 50 // скругляю углы до круга
        imageView.translatesAutoresizingMaskIntoConstraints = false // для  будущего создания констрейн
        
        return imageView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews() //1)вызываю метод при загрузке экрана
        setConstraints() // 2)вызываю метод создания констрэйнтов
        
    }
    
    private func setupViews(){ //настройки wiew
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1) // создаю цвет основной родительной wiew
        view.addSubview(userFotoImageView)// размещаю иконку пользователя на основной экран (wiew)
        
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
            userFotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
