//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by Franklin Amaya on 6/5/18.
//  Copyright © 2018 Franklin Amaya. All rights reserved.
//

import UIKit
import AudioToolbox

class KeyboardViewController: UIInputViewController{
    
    //words
    let words = ["Krzywinski", "rhythm", "convalesce", "pronunciation", "recommend"]
    var typed = ""
    var pastTyped = [String]()
    
    //keys on keyboard
    @IBOutlet weak var one: RoundButton!
    @IBOutlet weak var two: RoundButton!
    @IBOutlet weak var three: RoundButton!
    @IBOutlet weak var four: RoundButton!
    @IBOutlet weak var five: RoundButton!
    @IBOutlet weak var six: RoundButton!
    @IBOutlet weak var seven: RoundButton!
    @IBOutlet weak var eight: RoundButton!
    @IBOutlet weak var nine: RoundButton!
    @IBOutlet weak var ten: RoundButton!
    
    
    @IBOutlet weak var Q: RoundButton!
    @IBOutlet weak var W: RoundButton!
    @IBOutlet weak var E: RoundButton!
    @IBOutlet weak var R: RoundButton!
    @IBOutlet weak var T: RoundButton!
    @IBOutlet weak var Y: RoundButton!
    @IBOutlet weak var U: RoundButton!
    @IBOutlet weak var I: RoundButton!
    @IBOutlet weak var O: RoundButton!
    @IBOutlet weak var P: RoundButton!
    @IBOutlet weak var A: RoundButton!
    @IBOutlet weak var S: RoundButton!
    @IBOutlet weak var D: RoundButton!
    @IBOutlet weak var F: RoundButton!
    @IBOutlet weak var G: RoundButton!
    @IBOutlet weak var H: RoundButton!
    @IBOutlet weak var J: RoundButton!
    @IBOutlet weak var K: RoundButton!
    @IBOutlet weak var L: RoundButton!
    @IBOutlet weak var Z: RoundButton!
    @IBOutlet weak var X: RoundButton!
    @IBOutlet weak var C: RoundButton!
    @IBOutlet weak var V: RoundButton!
    @IBOutlet weak var B: RoundButton!
    @IBOutlet weak var N: RoundButton!
    @IBOutlet weak var M: RoundButton!
    
    
    @IBOutlet weak var Caps: RoundButton!
    @IBOutlet weak var other: RoundButton!
    
    //preferences
    var spellAssist = true
    var error = true

    @IBOutlet weak var nextKeyboard: UIButton!
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
    }
    
    //formality
    func isWord (word: String) -> Bool{
        if word.isEmpty{
            return true
        }
        for x in words{
            if word.lowercased() == x.prefix(word.count).lowercased(){
                return true
            }
        }
        return false
    }

    //hooking up each button to their corresponding letter or functionality
    
    @IBAction func buttonPressed(_ sender: RoundButton) {
        typed.append(sender.title(for: .normal)!)
        if spellAssist == true {
            if isWord(word: typed){
                print(isWord(word: typed))
                self.textDocumentProxy.insertText(sender.title(for: .normal)!)
            }
            
            else{
                if error == true{ AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate)) }
                typed = String(typed.dropLast())
            }
        }
        else{
            self.textDocumentProxy.insertText(sender.title(for: .normal)!)
        }
    }
    
    @IBAction func Space(_ sender: RoundButton) {
        if isWord(word: typed){
            typed.append(" ")
            pastTyped.append(typed)
            typed.removeAll()
            self.textDocumentProxy.insertText(" ")
        }
    }
    
    @IBAction func backspace(_ sender: RoundButton) {
        if pastTyped.count > 0 && typed.count == 0{
            typed = pastTyped[pastTyped.count-1]
            pastTyped.remove(at: pastTyped.count - 1)
        }
        typed = String(typed.dropLast())
        print(typed)
        self.textDocumentProxy.deleteBackward()
    }
    
    @IBAction func changeOther(_ sender: RoundButton) {
        if one.title(for: .normal) == "1"{
            one.setTitle(".", for: .normal)
            two.setTitle(",", for: .normal)
            three.setTitle("?", for: .normal)
            four.setTitle("!", for: .normal)
            five.setTitle("'", for: .normal)
            six.setTitle("-", for: .normal)
            seven.setTitle("/", for: .normal)
            eight.setTitle(":", for: .normal)
            nine.setTitle(";", for: .normal)
            ten.setTitle("'", for: .normal)
            other.setTitle("$([", for: .normal)
        }
        else if one.title(for: .normal) == "."{
            one.setTitle("$", for: .normal)
            two.setTitle("&", for: .normal)
            three.setTitle("%", for: .normal)
            four.setTitle("_", for: .normal)
            five.setTitle("+", for: .normal)
            six.setTitle("=", for: .normal)
            seven.setTitle("[", for: .normal)
            eight.setTitle("]", for: .normal)
            nine.setTitle("(", for: .normal)
            ten.setTitle(")", for: .normal)
            other.setTitle("123", for: .normal)
        }
        else{
            one.setTitle("1", for: .normal)
            two.setTitle("2", for: .normal)
            three.setTitle("3", for: .normal)
            four.setTitle("4", for: .normal)
            five.setTitle("5", for: .normal)
            six.setTitle("6", for: .normal)
            seven.setTitle("7", for: .normal)
            eight.setTitle("8", for: .normal)
            nine.setTitle("9", for: .normal)
            ten.setTitle("0", for: .normal)
            other.setTitle(".!?", for: .normal)
        }
    }
    
    
    @IBAction func CapitalizeButtons(_ sender: RoundButton) {
        if Q.title(for: .normal) == "Q"{
            Q.setTitle("q", for: .normal)
            W.setTitle("w", for: .normal)
            E.setTitle("e", for: .normal)
            R.setTitle("r", for: .normal)
            T.setTitle("t", for: .normal)
            Y.setTitle("y", for: .normal)
            U.setTitle("u", for: .normal)
            I.setTitle("i", for: .normal)
            O.setTitle("o", for: .normal)
            P.setTitle("p", for: .normal)
            A.setTitle("a", for: .normal)
            S.setTitle("s", for: .normal)
            D.setTitle("d", for: .normal)
            F.setTitle("f", for: .normal)
            G.setTitle("g", for: .normal)
            H.setTitle("h", for: .normal)
            J.setTitle("j", for: .normal)
            K.setTitle("k", for: .normal)
            L.setTitle("l", for: .normal)
            Z.setTitle("z", for: .normal)
            X.setTitle("x", for: .normal)
            C.setTitle("c", for: .normal)
            V.setTitle("v", for: .normal)
            B.setTitle("b", for: .normal)
            N.setTitle("n", for: .normal)
            M.setTitle("m", for: .normal)
            sender.backgroundColor = UIColor.lightGray
            sender.setTitle("caps", for: .normal)
        } else {
            Q.setTitle("Q", for: .normal)
            W.setTitle("W", for: .normal)
            E.setTitle("E", for: .normal)
            R.setTitle("R", for: .normal)
            T.setTitle("T", for: .normal)
            Y.setTitle("Y", for: .normal)
            U.setTitle("U", for: .normal)
            I.setTitle("I", for: .normal)
            O.setTitle("O", for: .normal)
            P.setTitle("P", for: .normal)
            A.setTitle("A", for: .normal)
            S.setTitle("S", for: .normal)
            D.setTitle("D", for: .normal)
            F.setTitle("F", for: .normal)
            G.setTitle("G", for: .normal)
            H.setTitle("H", for: .normal)
            J.setTitle("J", for: .normal)
            K.setTitle("K", for: .normal)
            L.setTitle("L", for: .normal)
            Z.setTitle("Z", for: .normal)
            X.setTitle("X", for: .normal)
            C.setTitle("C", for: .normal)
            V.setTitle("V", for: .normal)
            B.setTitle("B", for: .normal)
            N.setTitle("N", for: .normal)
            M.setTitle("M", for: .normal)
            sender.backgroundColor = UIColor.white
            sender.setTitle("CAPS", for: .normal)
        }
    }
    
    @IBAction func nextInput(_ sender: RoundButton) {
        advanceToNextInputMode()
    }
    
    //segue
    @IBAction func unwinding(_ sender: UIStoryboardSegue){}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SettingsViewController
        destVC.spellAssist = spellAssist
        destVC.error = error
    }
}
