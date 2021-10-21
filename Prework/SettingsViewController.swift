//
//  SettingsViewController.swift
//  Prework
//
//  Created by Orcun Tasdemir on 2021/10/12.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //Access user defaults once
    let defaults = UserDefaults.standard
    
    //when the view loads set the title to "Settings"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    //we use this line of code so that the keyboard
    //is hidden after we are done using it and click
    //somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    //the outlets are connected
    @IBOutlet weak var defaultTip1Field: UITextField!
    @IBOutlet weak var defaultTip2Field: UITextField!
    @IBOutlet weak var defaultTip3Field: UITextField!
    @IBOutlet weak var darkModeToggle: UISwitch!
    
    //darkmodetoggle function here saves the switch
    //configuration to defaults and calls the implement
    //darkmode function to decide whether we want the
    //darkmode or not
    @IBAction func darkToggle(_ sender: Any) {
        defaults.set(darkModeToggle.isOn, forKey: "darkMode")
        defaults.synchronize()
        implementDarkMode()
    }
    
    func implementDarkMode()
    {
        navigationController!.overrideUserInterfaceStyle = defaults.bool(forKey: "darkMode") ? .dark : .light
    }
    
    //we will use this function to access userdefaults
    //and save our default tip values right before
    //the settings view disappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //all 3 tips are being saved to the userDefault variables
        let tip1 = Double(defaultTip1Field.text!) ?? 15.0
        defaults.set(tip1, forKey: "defaultTip1")
        
        let tip2 = Double(defaultTip2Field.text!) ?? 18.0
        defaults.set(tip2, forKey: "defaultTip2")
        
        let tip3 = Double(defaultTip3Field.text!) ?? 20.0
        defaults.set(tip3, forKey: "defaultTip3")
        
        //the default values that are set are being recorded
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //before the view appears we want to set the
        //darkMode toggle to the already saved configuration
        //in the userDefaults
        darkModeToggle.setOn(defaults.bool(forKey: "darkMode"), animated: false)
        //we implement the darkMode again on every appear
        implementDarkMode()
    
        defaultTip1Field.text = String(defaults.double(forKey: "defaultTip1"))
        defaultTip2Field.text = String(defaults.double(forKey: "defaultTip2"))
        defaultTip3Field.text = String(defaults.double(forKey: "defaultTip3"))
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
