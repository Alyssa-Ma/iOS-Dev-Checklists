//
//  ViewController.swift
//  Checklists
//
//  Created by Alyssa Ma on 4/7/21.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //instance variables for checking checkmarks
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
    
    // MARK: - Table View Data Source
    override func tableView
    (
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var isChecked = false
            
            if indexPath.row == 0 {
                row0checked.toggle()
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1checked.toggle()
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2checked.toggle()
                isChecked = row2checked
            } else if indexPath.row == 3 {
                row3checked.toggle()
                isChecked = row3checked
            } else if indexPath.row == 4 {
                row4checked.toggle()
                isChecked = row4checked
            }
            
            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Checkmark Configuration
    func configureCheckmark(
        for cell: UITableViewCell,
        at indexPath: IndexPath){
            var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 100
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        //finding the view with tag 1000
        let label = cell.viewWithTag(1000) as! UILabel
        
        //index path is an object that points to a specific row in the table
        if indexPath.row % 5 == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
        }
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
}

