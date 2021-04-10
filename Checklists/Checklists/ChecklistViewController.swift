//
//  ViewController.swift
//  Checklists
//
//  Created by Alyssa Ma on 4/7/21.
//

import UIKit

class ChecklistViewController: UITableViewController {
    //array to hold checklist items
    var items = [ChecklistItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let item1 = ChecklistItem()
        item1.text = "Walk dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush teeth"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn ios"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Ice Cream"
        items.append(item5)
    }

    // MARK: - Table View Data Source
    override func tableView (
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Checkmark Configuration
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem){
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return items.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}

