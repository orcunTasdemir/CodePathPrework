//
//  SettingsViewController.swift
//  Prework
//
//  Created by Toshie Stewart on 2021/10/12.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var tip1 = 15.0
    var tip2 = 18.0
    var tip3 = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(toggle.isOn){
            print("the toggle is on!")
        }
        
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func onTap(_ sender: Any){
        //we use this line of code so that the keyboard
        //is hidden after we are done using it and click
        //somewhere else
        view.endEditing(true)
        
    }
    
    //the outlets are connected
    @IBOutlet weak var defaultTip1Field: UITextField!
    @IBOutlet weak var defaultTip2Field: UITextField!
    @IBOutlet weak var defaultTip3Field: UITextField!
    
    @IBOutlet weak var toggle: UISwitch!
    
    @IBAction func darkToggle(_ sender: Any) {
        if(toggle.isOn){
            print("the toggle is on!")
            self.view.backgroundColor = UIColor.black
        }
        if (!toggle.isOn){
            print("the toggle is off")
            self.view.backgroundColor = UIColor.white
        }
    }
    
    //we will use this function to access userdefaults
    //and save our default tip values right before
    //the settings view disappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        //all 3 tips are being saved to the userDefault variables
        tip1 = Double(defaultTip1Field.text!) ?? 0
        defaults.set(tip1, forKey: "defaultTip1")
        
        tip2 = Double(defaultTip2Field.text!) ?? 0
        defaults.set(tip2, forKey: "defaultTip2")
        
        tip3 = Double(defaultTip3Field.text!) ?? 0
        defaults.set(tip3, forKey: "defaultTip3")
        
        //the default values that are set are being recorded
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Access UserDefaults
        defaultTip1Field.text! = String(Int(tip1))
        defaultTip2Field.text! = String(Int(tip2))
        defaultTip3Field.text! = String(Int(tip3))
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
