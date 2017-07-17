//
//  CalculatorBrain.swift
//  Project 1
//
//  Created by James Oleary on 7/14/17.
//  Copyright © 2017 James Oleary. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double!
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equal
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi),
        "cos": Operation.UnaryOperation(cos),
        "±": Operation.UnaryOperation({(a) in -a}),
        "√": Operation.UnaryOperation(sqrt),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "=": Operation.Equal
    ]
    
    mutating func performOperation(_ symbol: String){
        
        if let operation = operations[symbol] {
            switch operation {
            case Operation.Constant(let value):
                accumulator = value
            case Operation.UnaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator)
                }
            case Operation.BinaryOperation(let function):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(firstOperand: accumulator, operation: function)
                }
            case Operation.Equal:
                if accumulator != nil && pbo != nil {
                    accumulator = pbo!.performOperation(accumulator)
                }
                pbo = nil
            }
        }
        
    }
    
    mutating func setOperand(_ operand: Double){
        accumulator = operand
    }
    
    private var pbo: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        var firstOperand: Double
        var operation: (Double, Double) -> Double
        
        func performOperation(_ secondOperand: Double) -> Double {
            return operation(firstOperand, secondOperand)
        }
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
