//
//  CalculatorBrain.swift
//  Project 1
//
//  Created by James Oleary on 7/14/17.
//  Copyright © 2017 James Oleary. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equal
    }
    
    
}
