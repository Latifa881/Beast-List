//
//  ViewController.swift
//  Beast List
//
//  Created by administrator on 06/12/2021.
//

import UIKit

class ViewController: UIViewController ,  BeastCellDelegate {
  
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        guard let task = taskTextField.text else{return}
        if !task.isEmpty{
            tasks.append(task)
            tableView.reloadData()
            taskTextField.text=""
        }
        
    }
    
    func showTaskDescription(description: String) {
        descriptionLabel.text = description
    }
}


extension ViewController: UITableViewDataSource , UITableViewDelegate{
    //Datasource
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! BeastTableViewCell
        cell.taskLabel.text = tasks[indexPath.row]
        // This line is very important! Now the cell has a reference to the view controller itself.
        cell.delegate = self
        return cell
    }
//    //Delegate
//    //What we write here will be implemented as soon as one of the table view cells are tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
//        tasks.remove(at: indexPath.row)
//        tableView.reloadData()
//
//    }
    
    
}
