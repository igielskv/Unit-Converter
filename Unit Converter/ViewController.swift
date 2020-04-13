//
//  ViewController.swift
//  Unit Converter
//
//  Created by Manoli on 09/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var distanceUnitsLabel: UILabel!
    @IBOutlet weak var distanceSwitch: UISwitch!
    @IBOutlet weak var distanceResultLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightUnitsLabel: UILabel!
    @IBOutlet weak var weightSwitch: UISwitch!
    @IBOutlet weak var weightResultLabel: UILabel!
    
    let numberFormatter = NumberFormatter()
    
    let mileToKm = 1.60934468
    let poundToKg = 0.45359227
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberFormatter.maximumFractionDigits = 5
        distanceResultLabel.isHidden = true
        weightResultLabel.isHidden = true
    }
        
    func updateDistance() {
        if let distanceText = distanceTextField.text, let distanceValue = Double(distanceText) {
            let result = distanceSwitch.isOn ? distanceValue / mileToKm : distanceValue * mileToKm
            let resultFormatted = numberFormatter.string(from: NSNumber(value: result))
            distanceResultLabel.text = resultFormatted
            distanceResultLabel.text?.append(distanceSwitch.isOn ? " mi" : " km")
            distanceResultLabel.isHidden = false
        } else {
            distanceResultLabel.isHidden = true
        }
    }
    
    func updateWeight() {
        if let weightText = weightTextField.text, let weightValue = Double(weightText) {
            let result = weightSwitch.isOn ? weightValue / poundToKg : weightValue * poundToKg
            let resultFormatted = numberFormatter.string(from: NSNumber(value: result))
            weightResultLabel.text = resultFormatted
            weightResultLabel.text?.append(distanceSwitch.isOn ? " lbs" : " kg")
            weightResultLabel.isHidden = false
        } else {
            weightResultLabel.isHidden = true
        }
    }
    
    @IBAction func distanceTextFieldChanged(_ sender: Any) {
        updateDistance()
    }
    
    @IBAction func distanceSwitchToggled(_ sender: Any) {
        distanceTextField.placeholder = distanceSwitch.isOn ? "Kilometers" : "Miles"
        distanceUnitsLabel.text = distanceSwitch.isOn ? "km" : "mi"
        updateDistance()
    }
    
    @IBAction func weightTextFieldChanged(_ sender: Any) {
        updateWeight()
    }
    
    @IBAction func weightSwitchToggled(_ sender: Any) {
        weightTextField.placeholder = weightSwitch.isOn ? "Kilograms" : "Pounds"
        weightUnitsLabel.text = weightSwitch.isOn ? "kg" : "lbs"
        updateWeight()
    }
    
}

