//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by CNTT on 4/2/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import Foundation

func sign(num:Double)->Double{
    return -num
}

func cong(numA : Double, numB : Double)->Double{
    return numA + numB
}

func tru(numA : Double, numB : Double)->Double{
    return numA - numB
}

func nhan(numA : Double, numB : Double)->Double{
    return numA * numB
}

func chia(numA : Double, numB : Double)->Double{
    return numA / numB
}

class CalculatorBrain{
    
    private var accumulator:Double?
    
    enum Operators {
        case constant(Double)
        case unaryOperator((Double)->Double)
        case binaryOperator((Double, Double)->Double)
        case equal
    }
    
    let myOperator:[String : Operators] = [
        "∏" : Operators.constant(Double.pi),
        "e" : Operators.constant(M_E),
        "√" : Operators.unaryOperator(sqrt),
        "±" : Operators.unaryOperator(sign),
        "Sin" : Operators.unaryOperator(sin),
        "+" : Operators.binaryOperator(cong),
        "-" : Operators.binaryOperator(tru),
        "x" : Operators.binaryOperator(nhan),
        "/" : Operators.binaryOperator(chia),
        "=" :Operators.equal
    ]
    
    struct BinaryOperatorPending {
        var firstOperand:Double
        var BinaryOperator:(Double, Double)->Double
        func calculate(second : Double) -> Double {
            return BinaryOperator(firstOperand, second)
        }
    }
    
    var temp:BinaryOperatorPending?
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    func calculate(mathOperator:String){
        
        if let math =  myOperator[mathOperator]{
            switch math{
                case .constant(let value):
                    accumulator = value
                case .unaryOperator(let value):
                    if let tmp = accumulator{
                        accumulator = value(tmp)
                    }
                case .binaryOperator(let biOperator):
                    
                    if let secondOperand = accumulator{
                        if let cal = temp{
                            accumulator = cal.calculate(second: secondOperand)
                            temp = nil
                        }
                    }
                    
                    if let value = accumulator{
                        temp = BinaryOperatorPending(firstOperand: value, BinaryOperator: biOperator)
                    }
                	
                case .equal:
                    if let secondOperand = accumulator{
                        if let cal = temp{
                            accumulator = cal.calculate(second: secondOperand)
                            temp = nil
                        }
                }
                
            }
        }
        
	
    }
    
    var result:Double? {
        get{
            if let value = accumulator{
                return value
            }
            return 0
        }
    }
    
}
