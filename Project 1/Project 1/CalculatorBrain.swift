//
//  CalculatorBrain.swift
//  Project 1
//
//  Created by James Oleary on 7/14/17.
//  Copyright © 2017 James Oleary. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var accumulator: Double!
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equal
    }
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi),
        "cos": Operation.UnaryOperation(cos),
        "±": Operation.UnaryOperation({(a) in -a}),
        "√": Operation.UnaryOperation(sqrt),
        "+": Operation.BinaryOperation({$0 + $1})
    ]
    
    mutating func performOperation(_ symbol: String){
        
        if let operation = operations[symbol] {
            switch operation {
            case Operation.Constant(let value):
                accumulator = value
            case Operation.UnaryOperation(let function):
                if accumulator != nil{
                    accumulator = function(accumulator)
                }
            default:
                break
            }
        }
        
    }
    
}
