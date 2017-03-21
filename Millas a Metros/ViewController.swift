//
//  ViewController.swift
//  Millas a Metros
//
//  Created by Santiago José González Rúa on 12/3/17.
//  Copyright © 2017 Santiago José González Rúa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedControlOut: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    let mileUnit = 1.609
    let yardUnit = 1093.61
    let yardMillaUnit = 1760.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = "Escribe la distancia a convertir"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(_ sender: UIButton) {
        
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let selectedIndexOut = segmentedControlOut.selectedSegmentIndex
        let conversionFactor = converFrom(fromUnit: selectedIndex, toUnit: selectedIndexOut)

        if let textFieldStr = dataTextField.text, let textFieldVal = Double(textFieldStr) {
            var convertedValue : Double
            convertedValue = textFieldVal * conversionFactor
            
            reloadView(textFieldVal: textFieldVal,convertedValue: convertedValue)
        } else {
            resultLabel.text = "Tienes que introducir la distancia"
        }
    }
    
    func reloadView(textFieldVal : Double, convertedValue : Double){
        let initValue = String(format: "%.2f", textFieldVal)
        let endValue = String(format: "%.2f", convertedValue)
        let nameIn : String = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!
        let nameOut : String = segmentedControl.titleForSegment(at: segmentedControlOut.selectedSegmentIndex)!
        resultLabel.text = "\(initValue) \(nameIn) son \(endValue) \(nameOut)"

    }
    
    func converFrom(fromUnit : Int, toUnit : Int) -> Double{
        if fromUnit == toUnit {
            return 1
        } else if fromUnit == 0 && toUnit == 1 {
            return mileUnit
        } else if fromUnit == 0 && toUnit == 2 {
            return yardUnit
        } else if fromUnit == 1 && toUnit == 0 {
            return 1/mileUnit
        } else if fromUnit == 1 && toUnit == 2 {
            return yardMillaUnit
        } else if fromUnit == 2 && toUnit == 0 {
            return 1/yardUnit
        } else if fromUnit == 2 && toUnit == 1 {
            return 1/yardMillaUnit
        }
        
        return 0
    }
    
}

