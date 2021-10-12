//
//  ViewController.swift
//  Prework
//
//  Created by Toshie Stewart on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {
    
    //the bill amount text field control dragged
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear!")
        //a good place to retrieve the default tip
        //percentage from userDefaults
        
        // Access UserDefaults again
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.integer(forKey: "defaultTip1")
        let tip2 = defaults.integer(forKey: "defaultTip2")
        let tip3 = defaults.integer(forKey: "defaultTip3")
        
        
        tipControl.setTitle(String(tip1), forSegmentAt: 0)
        tipControl.setTitle(String(tip2), forSegmentAt: 1)
        tipControl.setTitle(String(tip3), forSegmentAt: 2)
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
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        //now we can update the tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //and also update the total amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
}

