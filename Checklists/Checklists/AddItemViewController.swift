//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Alyssa Ma on 4/10/21.
//

import UIKit

class AddItemViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table View Delegates
    override func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
        return nil
    }
    
    //keyboard auto opens upon going to add item
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
}
