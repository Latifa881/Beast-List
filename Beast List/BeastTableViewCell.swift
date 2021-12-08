//
//  BeastTableViewCell.swift
//  Beast List
//
//  Created by administrator on 08/12/2021.
//

import UIKit

class BeastTableViewCell: UITableViewCell {

    // Here we need to create a variable that will hold a reference to the delegate...
     var delegate: BeastCellDelegate?
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func showButton(_ sender: UIButton) {
        // this is where we call the delegate's method to show the task in the task label
        delegate?.showTaskDescription(description: (self.taskLabel.text)!) 
    }
    

}
