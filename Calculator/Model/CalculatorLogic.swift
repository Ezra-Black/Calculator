//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Joseph Rogers on 6/30/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    
    private var number: Double?
    
    private var intermediateCalculation : (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number{
            
            if symbol == "+/-"{
                return n * -1
            }else if symbol == "AC"{
                return 0
            }else if symbol == "%"{
                return n * 0.01
            }else if symbol == "="{
                return performTwoNumberCalc(n2: n)
            }else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }//if something breaks its because of this fuck ass return nil
        return nil  }
    
    private func performTwoNumberCalc(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Something was passed in as an operation that was not capable of being used")
            }
        }
        return nil
    }
    
}
