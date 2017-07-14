//
//  ViewController.swift
//  Project 1
//
//  Created by James Oleary on 7/13/17.
//  Copyright © 2017 James Oleary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcDisplay: UILabel!
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    private var isUserTypingNumber = false
    
    private var currentValue: Double {
        get{
            return Double(calcDisplay.text!)!
        }
        set{
            calcDisplay.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        
        print("Digit pressed: \(sender.currentTitle!)")
        
        if !isUserTypingNumber {
            isUserTypingNumber = true
            calcDisplay.text = sender.currentTitle!
        }
        else {
            calcDisplay.text! += sender.currentTitle!
        }
        
    }

    @IBAction func performOperation(_ sender: UIButton) {
    
        print("Operation pressed: \(sender.currentTitle!)")
        
        isUserTypingNumber = false
        
        brain.accumulator = currentValue
        
        brain.performOperation(sender.currentTitle!)
        
        currentValue = brain.accumulator
        
    }
    
}

