//
//  CalculatorBrain.swift
//  Weight Watcher
//
//  Created by Yamusa Dalhatu on 03/11/2020.
//

import UIKit


// Read on the difference between a Struct and Class
struct CalculatorBrain {

  //  var bmi: Float?
    var bmi: BMI?
    
    func getAdvice() -> String {
        
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func getBMIValue() -> String {
     
        let bmiDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0 ) // Nil coalescing
        return bmiDecimalPlace
      
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi  = BMI(value: bmiValue, advice: "Underweight: Please eat more!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 25{
            bmi  = BMI(value: bmiValue, advice: "Fit fam! Stay hard! Oshey!", color: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
        } else {
            bmi  = BMI(value: bmiValue, advice: "Hmmn! Eat less, workout more!", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
        
     
    }
}
