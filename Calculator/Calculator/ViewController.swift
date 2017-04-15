//
//  ViewController.swift
//  Calculator
//
//  Created by Thiện Huỳnh on 4/14/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var lastButton = 0
    var operation = 0
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelHistory: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if label.text == "0" {
            label.text = String(sender.tag)
            
        }else{
            label.text = label.text! + String(sender.tag)
        }
        lastButton = sender.tag
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
            
        case 11:    // = button
            lastButton = sender.tag
            break
        case 12:    // + button
            if (lastButton >= 0 && lastButton <= 9) || lastButton == 11 || lastButton == 17 || lastButton == 18{
                //last is a number or ⌫ or C or =
                label.text! += "+"
                lastButton = sender.tag
            }else if lastButton == 13{
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                if temp.characters.last == "×" || temp.characters.last == "÷" || temp.characters.last == "%" {
                    // second last index not a number
                    temp.remove(at: temp.index(before: temp.endIndex))
                }
                label.text = temp
                label.text! += "+"
                lastButton = sender.tag
            }else if lastButton >= 12 && lastButton <= 16{
                //last is + - * ÷ %
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                label.text = temp
                label.text! += "+"
                lastButton = sender.tag
            }

            break
        case 13:    // - button
            
            if lastButton == 12 {
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                label.text = temp
                label.text! += "-"
                lastButton = sender.tag
            }else if lastButton != 10 && lastButton != 13{
                label.text! += "-"
                lastButton = sender.tag
            }
            break
        case 14:    // x button
            if (lastButton >= 0 && lastButton <= 9) || lastButton == 11 || lastButton == 17 || lastButton == 18{
                //last is a number or ⌫ or C or =
                label.text! += "×"
                lastButton = sender.tag
            }else if lastButton == 13{
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                if temp.characters.last == "×" || temp.characters.last == "÷" || temp.characters.last == "%" {
                    // second last index not a number
                    temp.remove(at: temp.index(before: temp.endIndex))
                }
                label.text = temp
                label.text! += "×"
                lastButton = sender.tag
            }else if lastButton >= 12 && lastButton <= 16{
                //last is + - * ÷ %
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                label.text = temp
                label.text! += "×"
                lastButton = sender.tag
            }
            break
        case 15:    // ÷ button
            if (lastButton >= 0 && lastButton <= 9) || lastButton == 11 || lastButton == 17 || lastButton == 18{
                //last is a number or ⌫ or C or =
                label.text! += "÷"
                lastButton = sender.tag
            }else if lastButton == 13{
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                if temp.characters.last == "×" || temp.characters.last == "÷" || temp.characters.last == "%" {
                    // second last index not a number
                    temp.remove(at: temp.index(before: temp.endIndex))
                }
                label.text = temp
                label.text! += "÷"
                lastButton = sender.tag
            }else if lastButton >= 12 && lastButton <= 16{
                //last is + - * / %
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                label.text = temp
                label.text! += "÷"
                lastButton = sender.tag
            }
            break
        case 16:    // % button
            
            break
        case 17:    // ⌫ button
            if label.text != "0" {
                var temp:String = label.text!
                temp.remove(at: temp.index(before: temp.endIndex))
                lastButton = sender.tag
            }
            
            break
        case 18:    // C button
            label.text = "0"
            lastButton = sender.tag
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

