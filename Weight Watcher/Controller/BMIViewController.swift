//
//  BMIViewController.swift
//  Weight Watcher
//
//  Created by Yamusa Dalhatu on 11/3/20.
//

import UIKit

class BMIViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    var bmiValue: String?
    @IBOutlet weak var heightSliderOutlet: UISlider!
    @IBOutlet weak var weightSliderOutlet: UISlider!
    
    @IBOutlet weak var myHeight: UILabel!
    @IBOutlet weak var myWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func heightSlider(_ sender: UISlider) {
        let height =  String(format:"%.2f", sender.value)
       myHeight.text = "\(height)M"
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight  = String(format: "%.1f", sender.value)
        myWeight.text = "\(weight)KG"
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        
        let height = heightSliderOutlet.value
        let weight = weightSliderOutlet.value
        
//        let bmi = weight / pow(height, 2)
//        print(bmi)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVc = segue.destination as! SecondViewController
            //destinationVc.bmiValue = "0.0"
            destinationVc.bmiValue = calculatorBrain.getBMIValue()
            destinationVc.advice = calculatorBrain.getAdvice()
            destinationVc.color = calculatorBrain.getColor()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
