
import SwiftUI

class CalculateViewController: UIViewController {
    
    var tip = 0.10
    var split = 1
    var tipStepper = 0
    // var resultsView = ResultsViewController()
    
    
    //var textInput = "" //String?

    @IBOutlet weak var userBillText: UITextField!
    
    @IBOutlet weak var zeroTip: UIButton!
    
    @IBOutlet weak var tenPct: UIButton!
    
    @IBOutlet weak var twenPct: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var CalcState: UIButton!
    
    @IBOutlet weak var tipStepperState: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipStepperAction(_ sender: UIStepper) {
        sender.isSelected = true
        
        // for increment viewbox
        let splitIncrementDisp = String(sender.value)
        splitLabel.text = splitIncrementDisp
        
        print("tip stepper status \(sender.isSelected)")
        print("tip stepper value \(sender.value)")

    }

    
    @IBAction func selectedTip(_ sender: UIButton) {
        sender.isSelected = true
        print("Selected Tip \(sender.isSelected)")
        zeroTip.isSelected = false
        tenPct.isSelected = false
        twenPct.isSelected = false
        sender.isSelected = true
        
        if zeroTip.isSelected == true {
            tip = 0.00
            print(tip)
            userBillText.endEditing(true)

        } else if tenPct.isSelected == true {
            tip = 0.10
            print(tip)
            userBillText.endEditing(true)


        } else {
            tip = 0.20
            print(tip)
            userBillText.endEditing(true)

        }
        
    }
    @IBAction func textViewInput(_ sender: UITextField) {
        let textInput = userBillText.text
        print(textInput)
    }
    
    @IBAction func calcAction(_ sender: UIButton) {
        //sender.isSelected = true
        var textInput = userBillText.text
        var totalInt = Double(textInput!)
        var splitInt = Double(splitLabel.text!)
        let calculatedTip = (tip * totalInt!) / splitInt!
        
        var strTip = String(tip)
        var strCalculated = String(calculatedTip)

        print("User amount input: \(textInput)")
        print("Calc Button Status: \(sender.isSelected)")
        print("Tip: \(tip)")
        print("Split Parties:  \(splitInt)")
        print("[Calculated Tip] \(calculatedTip)")
        
        self.performSegue(withIdentifier: "nextPage", sender: self)
    }
        
        // segue  name- nextPage
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            print("moving to next page")
            //sender.isSelected = true
            var textInput = userBillText.text
            var totalInt = Double(textInput!)
            var splitInt = Double(splitLabel.text!)
            let calculatedTip = (tip * totalInt!) / splitInt!
            
            var strTip = String(tip)
            var strCalculated = String(calculatedTip)

            if segue.identifier == "nextPage"{
                let destinationView = segue.destination as! ResultsViewController
                destinationView.split = splitInt!
                destinationView.tip = tip
                destinationView.results = strCalculated
            }
        }
}

