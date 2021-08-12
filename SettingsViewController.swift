//
//  SettingsViewController.swift
//  Prework
//
//  Created by Katy Merritt on 8/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var defaultTipSlider: UISlider!
    
    
    @IBOutlet weak var tipAmount: UILabel!
    
    
    @IBOutlet weak var clearLabel: UILabel!
    
    @IBOutlet weak var colorMode: UISegmentedControl!
    
    @IBOutlet weak var invisibleLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let modeValue = defaults.double(forKey: "myInt")
        colorMode.selectedSegmentIndex = Int(modeValue)
        let doubleValue = defaults.double(forKey: "myDouble")
       
        defaults.set(invisibleLabel.text, forKey: "myInt")
        if (modeValue == 0)
        {
            self.view.backgroundColor = UIColor.white
            firstLabel.textColor = UIColor.black
            tipAmount.textColor = UIColor.black
        }
        if (modeValue == 1)
        {
            self.view.backgroundColor = UIColor.gray
            firstLabel.textColor = UIColor.red
            tipAmount.textColor = UIColor.red
        }
        if (modeValue == 2)
        {
            self.view.backgroundColor = UIColor.black
            firstLabel.textColor = UIColor.white
            tipAmount.textColor = UIColor.white
        }
        defaultTipSlider.value = Float(doubleValue)
        let currentValue = Int(doubleValue * 100)
        tipAmount.text = "\(currentValue)%"
        let permanentValue = Double(currentValue) * 0.01
        clearLabel.text = "\(permanentValue)"
        // Do any additional setup after loading the view.
    }
    let defaults = UserDefaults.standard
    
    @IBAction func defaultTipSetter(_ sender: UISlider) {
        let currentValue = Int(sender.value * 100)
        tipAmount.text = "\(currentValue)%"
        let permanentValue = Double(currentValue) * 0.01
        clearLabel.text = "\(permanentValue)"
        defaults.set(clearLabel.text, forKey: "myDouble")
        defaults.synchronize()
    }
    
    @IBAction func colorChanger(_ sender: UISegmentedControl) {
        let modes = [0,1,2]
        let modevalue = modes[colorMode.selectedSegmentIndex]
        invisibleLabel.text = "\(modevalue)"
        defaults.set(invisibleLabel.text, forKey: "myInt")
        if (modevalue == 0)
        {
            self.view.backgroundColor = UIColor.white
            firstLabel.textColor = UIColor.black
            tipAmount.textColor = UIColor.black
        }
        if (modevalue == 1)
        {
            self.view.backgroundColor = UIColor.gray
            firstLabel.textColor = UIColor.red
            tipAmount.textColor = UIColor.red
        }
        if (modevalue == 2)
        {
            self.view.backgroundColor = UIColor.black
            firstLabel.textColor = UIColor.white
            tipAmount.textColor = UIColor.white
        }
       
        defaults.synchronize()
        
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
