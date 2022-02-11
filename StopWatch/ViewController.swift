//
//  ViewController.swift
//  StopWatch
//
//  Created by Tomomi Hori on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    var score: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(){
        if !timer.isValid{
            hanteiLabel.text = " "
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        
        count = 0.0
        label.text = String(format: "%.2f", count)
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        
        score = count - 10.0
        if abs(score) <= 0.2 {
            
            hanteiLabel.text = "PERFECT!"
            
        } else if abs(score) <= 0.3 {
            
            hanteiLabel.text = "GREAT!"
            
        } else if abs(score) <= 0.5 {
            
            hanteiLabel.text = "GOOD!"
            
        } else {
            
            hanteiLabel.text = "BAD!"
            
        }
    }


}

