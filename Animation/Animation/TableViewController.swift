//
//  TableViewController.swift
//  Animation
//
//  Created by Thiện Huỳnh on 4/12/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class TableViewController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cool effects \(indexPath.row)"
        return cell
    }
    func animeTable(){
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells{
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter)*0.05, usingSpringWithDamping: 3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
