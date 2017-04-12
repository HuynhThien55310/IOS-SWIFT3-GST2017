//
//  ButtonViewController.swift
//  Animation
//
//  Created by Thiện Huỳnh on 4/12/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class ButtonViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func bounce(_ sender: Any) {
        let theButton = sender as! UIButton
        let bounds = theButton.bounds
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
            theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)
        }) { (success:Bool) in
            if success {
                UIView.animate(withDuration: 0.5, animations: {
                    theButton.bounds = bounds
                })
            }
        }
    }
}
