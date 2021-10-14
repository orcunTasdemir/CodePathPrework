//
//  ViewController.swift
//  Prework
//
//  Created by Orcun Tasdemir on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {
    
    //define 3 tip parameters
    var tip1 = 15.0
    var tip2 = 18.0
    var tip3 = 20.0
    
    //the bill amount text field
    @IBOutlet weak var billAmountTextField: UITextField!
    //the tip amount label
    @IBOutlet weak var tipAmountLabel: UILabel!
    //segmented tip control
    @IBOutlet weak var tipControl: UISegmentedControl!
    //total price label
    @IBOutlet weak var totalLabel: UILabel!
    
    //this function is to update the default tip values
    //shown on the segmented tip control by pulling
    //userdefaults values from the settings view controller
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("view will appear!")
        
        //Access user defaults
        let defaults = UserDefaults.standard
        
        //update tip values from the userDefaults
        tip1 = defaults.double(forKey: "defaultTip1")
        tip2 = defaults.double(forKey: "defaultTip2")
        tip3 = defaults.double(forKey: "defaultTip3")
        
        //Create new titles for the tip values
        let tip1String = String(Int(tip1)) + "%"
        let tip2String = String(Int(tip2)) + "%"
        let tip3String = String(Int(tip3)) + "%"
        
        //update the title to the segments
        tipControl.setTitle(tip1String, forSegmentAt: 0)
        tipControl.setTitle(tip2String, forSegmentAt: 1)
        tipControl.setTitle(tip3String, forSegmentAt: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTap(_sender: Any){
        //we use this line of code so that the keyboard
        //is hidden after we are done using it and click
        //somewhere else
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get the bill amount reading from the text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get the total tip amount by multiplying
        //the bill and tip percentage
        
        let tipPercentages =  [tip1/100, tip2/100, tip3/100]
        
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex])
        
        let total = bill + tip
        
        //now we can update the tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //and also update the total amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
}

