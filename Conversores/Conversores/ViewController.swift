//
//  ViewController.swift
//  Conversores
//
//  Created by Giovanna Danelli Pau on 14/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var customView: View? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        customView?.unit2Button.alpha = 0.5
    }
    
    func buildView(){
        view = View()
        customView = view as? View
        customView?.nextButton.addTarget(self, action: #selector(showNext), for: .touchUpInside)
        customView?.unit1Button.addTarget(self, action: #selector(convertButton), for: .touchUpInside)
        customView?.unit2Button.addTarget(self, action: #selector(convertButton), for: .touchUpInside)
    }
    
    @objc func showNext(_ sender: UIButton){
        switch customView?.titleLabel.text! {
            case "Temperatura":
                customView?.titleLabel.text = "Peso"
                customView?.unit1Button.setTitle("Kilograma", for: .normal)
                customView?.unit2Button.setTitle("Libra", for: .normal)
            case "Peso":
                customView?.titleLabel.text = "Moeda"
                customView?.unit1Button.setTitle("Real", for: .normal)
                customView?.unit2Button.setTitle("Dólar", for: .normal)
            case "Moeda":
                customView?.titleLabel.text = "Distância"
                customView?.unit1Button.setTitle("Metro", for: .normal)
                customView?.unit2Button.setTitle("Kilômetro", for: .normal)
            default:
                customView?.titleLabel.text = "Temperatura"
                customView?.unit1Button.setTitle("Celsius", for: .normal)
                customView?.unit2Button.setTitle("Fahrenheit", for: .normal)
        }
        convertButton(nil)
    }
    
    @objc func convertButton(_ sender: UIButton?) {
        if let sender = sender {
            if sender == customView?.unit1Button {
                customView?.unit2Button.alpha = 0.5
            } else {
                customView?.unit1Button.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch customView?.titleLabel.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        guard let r = customView?.resultLabel.text else { return }
        let result = Double(r)
        customView?.resultLabel.text = String(format: "%.2f", result!)
    }
    
    func calcTemperature(){
        guard let t = customView?.valueText.text else { return }
        guard let temp = Double(t) else { return }
        if customView?.unit1Button.alpha == 1.0 {
            customView?.resultUnitLabel.text = "Fahrenheit"
            customView?.resultLabel.text = String(temp * 1.8 + 32.0)
        } else {
            customView?.resultUnitLabel.text = "Celsius"
            customView?.resultLabel.text = String((temp - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let w = customView?.valueText.text else { return }
        guard let weight = Double(w) else { return }
        if customView?.unit1Button.alpha == 1.0 {
            customView?.resultUnitLabel.text = "Libra"
            customView?.resultLabel.text = String(weight / 2.2046)
        } else {
            customView?.resultUnitLabel.text = "Kilograma"
            customView?.resultLabel.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency(){
        guard let c = customView?.valueText.text else { return }
        guard let currency = Double(c) else { return }
        if customView?.unit1Button.alpha == 1.0 {
            customView?.resultUnitLabel.text = "Dólar"
            customView?.resultLabel.text = String(currency / 5.27)
        } else {
            customView?.resultUnitLabel.text = "Real"
            customView?.resultLabel.text = String(currency * 5.27)
        }
    }
    
    func calcDistance(){
        guard let d = customView?.valueText.text else { return }
        guard let distance = Double(d) else { return }
        if customView?.unit1Button.alpha == 1.0 {
            customView?.resultUnitLabel.text = "Kilômetros"
            customView?.resultLabel.text = String(distance / 1000)
        } else {
            customView?.resultUnitLabel.text = "Metros"
            customView?.resultLabel.text = String(distance * 1000)
        }
    }
}

