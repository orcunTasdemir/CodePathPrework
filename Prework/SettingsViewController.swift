//
//  SettingsViewController.swift
//  Prework
//
//  Created by Toshie Stewart on 2021/10/12.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    //we will use this function to access userdefaults
    //and save our default tip values right before
    //the settings view disappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        let tip1 = Double(defaultTip1Field.text!) ?? 0
        defaults.set(tip1, forKey: "defaultTip1")
        
        let tip2 = Double(defaultTip2Field.text!) ?? 0
        defaults.set(tip2, forKey: "defaultTip2")
        
        let tip3 = Double(defaultTip3Field.text!) ?? 0
        defaults.set(tip3, forKey: "defaultTip3")
        
        defaults.synchronize()
    }
    
    @IBAction func updateDefaultTip(_ sender: Any){
        
        
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
