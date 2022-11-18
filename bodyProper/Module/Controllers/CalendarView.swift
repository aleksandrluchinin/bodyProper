//
//  CalendarView.swift
//  bodyProper
//
//  Created by Aleksandr Luchinin on 08.11.2022.
//

import UIKit

class CalendarView: UIView {
    
    //создаю коллекцию календаря на view
    private var collectionView: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3 //расстояние между колециями
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none //прозрачно
        
        return collectionView
    }
    private let idCalendarCell = "idCalendarCell" //идентификатор ячейки
    
    override init(frame: CGRect) { //создаю инициализатор класса CalendarView
        super.init(frame: frame)
        
        setupView()
        setConstraint()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        //регистрирую ячейку
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
        
    }
    //применение обязательных методов протокола
    private func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
//MARK: - UICollectionViewDataSource
// подписываюсь на протокол DataSourse
extension CalendarView: UICollectionViewDataSource {
    
    // указываю количество секций(1) и ячеек(7)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    // метод переиспользования ячеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // создаю переиспользуемую ячейку  методе
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
//MARK: - UICollectionViewDelegate
//подписываюсь на протокол UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {
    
    //метод когда ячейку выделили
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
//MARK: - UICollectionViewDelegateFlowLayout
//размеры ячейки

extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
}

// MARK: - Set Constraints

extension CalendarView {
    
    //размещаю колекцию ячеек на view
    private func setConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
        ])
    }
}


