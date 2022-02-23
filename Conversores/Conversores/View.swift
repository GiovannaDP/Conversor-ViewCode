//
//  View.swift
//  Conversores
//
//  Created by Giovanna Danelli Pau on 14/02/22.
//

import UIKit

class View: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addSubview(firstView)
        addViewsToFirst()
        addViewsToSecond()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Temperatura"
        label.font = .systemFont(ofSize: 34.0, weight: .light)
        label.textColor = .white
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(">", for: .normal)
        return button
    }()
    
    lazy var valueText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor.init(red: 93/255, green: 180/255, blue: 241/255, alpha: 1.0)
        text.text = "0"
        text.textColor = .white
        text.font = .systemFont(ofSize: 100)
        text.textAlignment = .center
        return text
    }()
    
    lazy var unit1Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Celsius", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .light)
        button.titleLabel?.alpha = 1.0
        return button
    }()
    
    lazy var unit2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Farenheint", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .light)
        return button
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = .systemFont(ofSize: 100)
        label.textColor = UIColor.init(red: 73/255, green: 171/255, blue: 239/255, alpha: 1.0)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultUnitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "unit"
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.textColor = UIColor.init(red: 73/255, green: 171/255, blue: 239/255, alpha: 1.0)
        return label
    }()

    
    func addViewsToFirst(){
        self.firstView.addSubview(titleLabel)
        self.firstView.addSubview(nextButton)
        self.firstView.addSubview(valueText)
        self.firstView.addSubview(unit1Button)
        self.firstView.addSubview(unit2Button)
        self.firstView.addSubview(secondView)
    }
    
    func addViewsToSecond(){
        self.secondView.addSubview(resultLabel)
        self.secondView.addSubview(resultUnitLabel)
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            
            self.nextButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.nextButton.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -6),
            
            self.valueText.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 30),
            self.valueText.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 30),
            self.valueText.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -30),
            
            self.unit1Button.topAnchor.constraint(equalTo: self.valueText.bottomAnchor, constant: 140),
            self.unit1Button.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 35),
            
            self.unit2Button.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -35),
            self.unit2Button.centerYAnchor.constraint(equalTo: self.unit1Button.centerYAnchor),
            
            self.secondView.topAnchor.constraint(equalTo: self.unit1Button.bottomAnchor, constant: 20),
            self.secondView.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor),
            self.secondView.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor),
            self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.secondView.topAnchor, constant: 90),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.secondView.leadingAnchor, constant: 16),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.secondView.trailingAnchor, constant: -16),
            
            self.resultUnitLabel.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: -6),
            self.resultUnitLabel.centerXAnchor.constraint(equalTo: self.secondView.centerXAnchor)
        ])
    }
}
