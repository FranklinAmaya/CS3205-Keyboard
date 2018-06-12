//
//  ViewController.swift
//  SpellSister
//
//  Created by Franklin Amaya on 6/5/18.
//  Copyright © 2018 Franklin Amaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seconds  = 0
    var timer = Timer()
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var start: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: UIButton) {
        seconds = 0
        timeLabel.text = String(seconds)
    }
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter(){
        seconds += 1
        timeLabel.text = String(seconds)
    }
    
    
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    
}

