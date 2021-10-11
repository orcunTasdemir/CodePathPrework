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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

