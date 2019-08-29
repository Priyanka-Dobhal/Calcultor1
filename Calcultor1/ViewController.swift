//
//  ViewController.swift
//  Calcultor1
//
//  Created by Priyanka Dobhal on 07/08/19.
//  Copyright © 2019 Priyanka Dobhal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var previousNumber:Double=0
    var numberOnScreen:Double=0
    var performOperation = false
    var operation = 0
    var resultDisplayed=false
 
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
 
        if performOperation==true{
            performOperation=false
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
        else{
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        }
 
    }
 
    @IBAction func buttons(_ sender: UIButton) {
 
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12{
                label.text = "/"
            }
            else if sender.tag == 13 {
                label.text = "*"
            }
            else if sender.tag == 14 {
                label.text = "-"
            }
            else if sender.tag == 15 {
                label.text = "+"
            }
            performOperation=true
            operation=sender.tag
        }
        else if sender.tag == 16
        {
            if(operation == 12){
                label.text = String(previousNumber / numberOnScreen)
            }
            else if(operation == 13){
                label.text = String(previousNumber * numberOnScreen)
            }
            else if(operation == 14){
                label.text = String(previousNumber - numberOnScreen)
            }
            else if(operation == 15){
                label.text = String(previousNumber + numberOnScreen)
            }
            resultDisplayed = true;
        }
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}

