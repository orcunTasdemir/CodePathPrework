//
//  ViewController.swift
//  Prework
//
//  Created by Orcun Tasdemir on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {
    
    //access the defaults
    let defaults = UserDefaults.standard
    
    //get the number formatter so we can control how many
    //digits we want
    let numFormatter = NumberFormatter()
    
    //the bill amount text field
    @IBOutlet weak var billAmountTextField: UITextField!
    //the tip amount label
    @IBOutlet weak var tipAmountLabel: UILabel!
    //segmented tip control
    @IBOutlet weak var tipControl: UISegmentedControl!
    //total price label
    @IBOutlet weak var totalLabel: UILabel!
    //Party size text field outlet
    @IBOutlet weak var partySizeTextField: UITextField!
    //outlet for the stepper
    @IBOutlet weak var stepperOutlet: UIStepper!
    //outlet for the perperson total label
    @IBOutlet weak var perPersonTotal: UILabel!
    
    //function for the partySize stepper so that everytime
    //the stepper is updated we can also update the
    //partySizeTextLabel
    @IBAction func partyStepper(_ sender: Any) {
        let partySize = Int(stepperOutlet.value)
        partySizeTextField.text = String(partySize)
    }
    
    //this function is to update the default tip values
    //shown on the segmented tip control by pulling
    //userdefaults values from the settings view controller
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("view will appear!")
        
        //for every reopening of the app we override the style
        //from the userDefaults parameter
        navigationController!.overrideUserInterfaceStyle = defaults.bool(forKey: "darkMode") ? .dark : .light
        
        //update tip values from the userDefaults
        let tip1 = defaults.double(forKey: "defaultTip1")
        let tip2 = defaults.double(forKey: "defaultTip2")
        let tip3 = defaults.double(forKey: "defaultTip3")
        
        //Create new titles for the tip values
        let tip1String = String(Int(tip1)) + "%"
        let tip2String = String(Int(tip2)) + "%"
        let tip3String = String(Int(tip3)) + "%"
        
        //update the title to the segments
        tipControl.setTitle(tip1String, forSegmentAt: 0)
        tipControl.setTitle(tip2String, forSegmentAt: 1)
        tipControl.setTitle(tip3String, forSegmentAt: 2)
    }
    
    @IBAction func onTap(_sender: Any){
        //we use this line of code so that the keyboard
        //is hidden after we are done using it and click
        //somewhere else
        view.endEditing(true)
    }
    
    //our main function to calculate the tip value and the totals
    //everytime the button is pressed we are calling this function
    @IBAction func calculateButton(_ sender: UIButton) {
        
        sender.startAnimatingPressActions()
        //get the bill amount reading from the text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //set the tip values from the userDefaults
        let tip1 = defaults.double(forKey: "defaultTip1")
        let tip2 = defaults.double(forKey: "defaultTip2")
        let tip3 = defaults.double(forKey: "defaultTip3")
        
        //setting the array
        let tipPercentages =  [tip1/100, tip2/100, tip3/100]
        
        //accessing the tip value through our array using the
        //selectedSegmentIndex function
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex])
        
        //total then would be the tip value plus the bill
        let total = bill + tip
        
        //now we can update the tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //and also update the total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        //partysize is calculated from the text field
        let partySize =  Double(partySizeTextField.text!) ?? 0
        
        //per person total is calculated
        let perPersonBill = total / partySize
        
        //perPersonTotal is then updated
        perPersonTotal.text =  String(format: "$%.2f", perPersonBill)
        
        //calculations are complete!
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
        numFormatter.numberStyle = .currency
        numFormatter.maximumFractionDigits = 2
        numFormatter.minimumFractionDigits = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

