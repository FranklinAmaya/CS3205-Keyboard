//
//  SettingsViewController.swift
//  CustomKeyboard
//
//  Created by Franklin Amaya on 6/8/18.
//  Copyright © 2018 Franklin Amaya. All rights reserved.
//

import UIKit

class SettingsViewController: UIInputViewController{
    
    //declaration
    var spellAssist = true
    var error = true
    
    @IBOutlet weak var ER: UISwitch!
    @IBOutlet weak var SA: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if error == true{
            ER.setOn(true, animated: true)
        } else {
            ER.setOn(false, animated: true)
        }
        
        if spellAssist == true{
            SA.setOn(true, animated: true)
        } else {
            SA.setOn(false, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: RoundButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //segue

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! KeyboardViewController
        destVC.spellAssist = spellAssist
        destVC.error = error
    }
    
    //settings
    @IBAction func Assister(_ sender: UISwitch) {
        if(sender.isOn == true){
            spellAssist = true
        } else {
            spellAssist = false
        }
        print(spellAssist)
    }
    
    @IBAction func errorNotification(_ sender: UISwitch) {
        if(sender.isOn == true){
            error = true
        } else {
            error = false
        }
        print(error)
    }
}
