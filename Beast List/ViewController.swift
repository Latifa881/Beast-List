//
//  ViewController.swift
//  Beast List
//
//  Created by administrator on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskTextField: UITextField!
    
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }


    @IBAction func beastButtonPressed(_ sender: UIButton) {
        guard let task = taskTextField.text else{return}
        if !task.isEmpty{
        tasks.append(task)
        tableView.reloadData()
        taskTextField.text=""
        }
        
    }
}


extension ViewController: UITableViewDataSource {


    // MAKE SURE THESE ARE WITHIN UITableViewDataSource EXTENSION!
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }

    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }



}
