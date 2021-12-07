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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    //Delegate
    //What we write here will be implemented as soon as one of the table view cells are tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
}
