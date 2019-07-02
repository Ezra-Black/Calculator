import UIKit
class ViewController: UIViewController {
    //a variable to Check the overall condition if a symbol operator was hit etc
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot convert display label to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
      
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            
    
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
          
        }
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
