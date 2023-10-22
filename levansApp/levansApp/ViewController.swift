//
//  ViewController.swift
//  levansApp
//
//  Created by Levan Loladze on 22.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    // GCD LCM Switch
    @IBOutlet weak var gcdlcmSwitch: UISwitch!
    @IBOutlet weak var gcdlcmLabel: UILabel!
    
    // Calculate Button
    @IBOutlet weak var calculateBtn: UIButton!
    
    // Text Fields
    @IBOutlet weak var calculableNum1: UITextField!
    @IBOutlet weak var calculableNum2: UITextField!
    
    // Result Label
    @IBOutlet weak var resultLabel: UILabel!
    
    var isGCD: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gcdlcmLabel.text = "GCD"
        calculateBtn.setTitle("Calculate", for: .normal)
        resultLabel.text = "GCD: "
    }

    @IBAction func gcdlcmSwitchAction(_ sender: Any) {
        
        if gcdlcmLabel.text == "GCD" {
            
            gcdlcmLabel.text = "LCM"
            resultLabel.text = "LCM: "
            isGCD = false

        } else {
            
            gcdlcmLabel.text = "GCD"
            resultLabel.text = "GCD: "
            isGCD = true
            
        }
    }

    @IBAction func calculate(_ sender: Any) {
        
        if let textfieldInt = Int(calculableNum1.text ?? ""), let textfield2Int = Int(calculableNum2.text ?? "") {
            
            if isGCD {
                
                let result = findGCD(num1: textfieldInt, num2: textfield2Int)
                resultLabel.text = String(result)
                
            } else {
                
                let result = findLcm(num1: textfieldInt, num2: textfield2Int)
                resultLabel.text = String(result)
                
            }
            
        } else {
            
            calculableNum1.backgroundColor = UIColor.red
            calculableNum2.backgroundColor = UIColor.red
            
        }
        
    }
    
    
    //MARK: Calculation functions
    func findGCD(num1: Int, num2: Int) -> Int {
        
        let output: Int = num1 % num2
        
        if output != 0 {
            return findGCD(num1: num2, num2: output)
        } else {
            return num2
        }
    }
    
    func findLcm(num1: Int, num2: Int) -> Int {
        return (num1 * num2/findGCD(num1: num1, num2: num2))
    }
    
}

