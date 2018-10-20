//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 村上拓麻 on 2018/10/20.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var numberOnScreen : Double = 0
    var previousNumber:Double = 0
    var performingPath = false
    var operation = 0
    
    @IBOutlet var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingPath == true{
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingPath = false
        }else{
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton){
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16{    //"C"と"="ボタン以外だったら
         
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12{    //割り算
                label.text = "/"
            }else if sender.tag == 13{  //掛け算
                label.text = "×"
            }else if sender.tag == 14{  //引き算
                label.text = "-"
            }else if sender.tag == 15{  //足し算
                label.text = "+"
            }
            operation = sender.tag
            performingPath = true
        
        } else if sender.tag == 16{
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
            }
        }else if sender.tag == 11{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        }

    }
 
    
    

