//
//  ViewController.swift
//  Calculator
//
//  Created by CNTT on 3/26/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var lblResult: UILabel!
    var firstTouchFlag = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Button's action
    
    @IBAction func btnPress(_ sender: UIButton) {
        
        let num2 = sender.currentTitle!
        
        if firstTouchFlag{
            if(sender.currentTitle != "0"){
                lblResult.text = num2
                firstTouchFlag = false
                return
            }
            
            lblResult.text = num2
        }
        
        if firstTouchFlag == false{
            let num1 = lblResult.text!
            lblResult.text = (num1 + num2)
            
        }
        
    }
    
    var calResultDoubleValue:Double {
        get{
            if let strValue = lblResult.text{
                if let doubleValue = Double(strValue){
                    return doubleValue
                }
            }
            
            return 0
        }
        set{
            lblResult.text = String(newValue)
        }
    }
    
    let calBrain = CalculatorBrain()
    
    @IBAction func calFunc(_ sender: UIButton) {
        calBrain.setOperand(operand:calResultDoubleValue)
        
        if let btnName = sender.currentTitle{
            calBrain.calculate(mathOperator: btnName)
        }
     
        if let value = calBrain.result {
            calResultDoubleValue = value
        }
        
        firstTouchFlag = true
        
    }
}

