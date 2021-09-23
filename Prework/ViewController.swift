//
//  ViewController.swift
//  Prework
//
//  Created by Katy Merritt on 8/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NumberOfPeople: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billAmount: UILabel!
   
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
   
    @IBOutlet weak var numofPeople: UITextField!
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var whiteLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    let defaults = UserDefaults.standard
    

 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear (_ animated: Bool) {
    super.viewWillAppear(animated)
    print("view will appear")
 
        let DoubleValue = defaults.double(forKey: "myDoubleBill")
        billLabel.text = String(DoubleValue)
        print(DoubleValue)
        billAmountTextField.text = billLabel.text
        
        let doubleValue = defaults.double(forKey: "myDouble")
        tipPercentageSlider.value = Float(doubleValue)
        let currentValue = Int(doubleValue * 100)
        tipPercentageLabel.text = "\(currentValue)%"
        let permanentValue = Double(currentValue) * 0.01
        whiteLabel.text = "\(permanentValue)"
        
        
        //bill amount
     
        let bill = Double(billAmountTextField.text!) ?? 0
       
        let check = Double(whiteLabel.text!) ?? 0
        var tip:Double = 0
       
             tip = bill * check
        
        
       
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Here is where color changes
        
        let modeValue = defaults.double(forKey: "myInt")
        if (modeValue == 0)
        {
            self.view.backgroundColor = UIColor.white
            billAmountTextField.backgroundColor = UIColor.white
            billAmount.textColor = UIColor.black
            tipLabel.textColor  = UIColor.black
            tipAmountLabel.textColor = UIColor.black
            tipPercentageLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            totalAmountLabel.textColor = UIColor.black
            billAmountTextField.textColor = UIColor.black
            NumberOfPeople.textColor = UIColor.black
            numofPeople.backgroundColor = UIColor.white
            numofPeople.textColor  = UIColor.black
          
        }
        if (modeValue == 1)
        {
            self.view.backgroundColor = UIColor.gray
            billAmountTextField.backgroundColor = UIColor.gray
            billAmount.textColor = UIColor.red
            tipLabel.textColor  = UIColor.red
            tipAmountLabel.textColor = UIColor.red
            tipPercentageLabel.textColor = UIColor.red
            totalLabel.textColor = UIColor.red
            totalAmountLabel.textColor = UIColor.red
            billAmountTextField.textColor = UIColor.red
            NumberOfPeople.textColor = UIColor.red
            numofPeople.backgroundColor = UIColor.gray
            numofPeople.textColor = UIColor.red
         
        }
        if (modeValue == 2)
        {
            self.view.backgroundColor = UIColor.black
            billAmountTextField.backgroundColor = UIColor.black
            billAmount.textColor = UIColor.white
            billAmount.textColor = UIColor.white
            tipLabel.textColor  = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            tipPercentageLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            totalAmountLabel.textColor = UIColor.white
            billAmountTextField.textColor = UIColor.white
            NumberOfPeople.textColor = UIColor.white
            numofPeople.backgroundColor = UIColor.black
            numofPeople.textColor = UIColor.white
       
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
      billAmountTextField.becomeFirstResponder()
        billLabel.text = billAmountTextField.text
        
    //  let myBill = billLabel.text
     //   defaults.set(myBill, forKey: "myDoubleBill")
        defaults.synchronize()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
      
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
            super.viewDidDisappear(animated)
            print("view did disappear")
        
    }
    

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value * 100)
        tipPercentageLabel.text = "\(currentValue)%"
        let permanentValue = Double(currentValue) * 0.01
        whiteLabel.text = "\(permanentValue)"
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let number = Double(numofPeople.text!)  ?? 0
           let bill = Double(billAmountTextField.text!) ?? 0
           
        
           let check = Double(whiteLabel.text!) ?? 0
           var tip:Double = 0
          
                tip = bill * check
           
           
          // let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
           let total = (bill + tip) / number
           tipAmountLabel.text = String(format: "$%.2f", tip)
           totalLabel.text = String(format: "$%.2f", total)
           defaults.synchronize()
       }
    
    @IBAction func CalculateTip(_ sender: Any) {
        billLabel.text = billAmountTextField.text
        let myBill = billLabel.text
          defaults.set(myBill, forKey: "myDoubleBill")
   
        let bill = Double(billAmountTextField.text!) ?? 0
        let number = Double(numofPeople.text!)  ?? 0
     
        let check = Double(whiteLabel.text!) ?? 0
        var tip:Double = 0
       
             tip = bill * check
        
        
       
        let total = (bill + tip) / number
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        defaults.synchronize()
    }
 
    
}


