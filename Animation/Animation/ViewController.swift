//
//  ViewController.swift
//  Animation
//
//  Created by Thiện Huỳnh on 4/12/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2Constraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1Constraint.constant -= view.bounds.width
        button2Constraint.constant -= view.bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var animationPerformedOnce = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !animationPerformedOnce{
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.button1Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.button2Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            animationPerformedOnce = true
        }
        
    }

}

