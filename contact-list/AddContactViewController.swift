//
//  AddContactViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

protocol AddContactViewControllerDelegate: class {
    func addContactViewControllerDidCancel(_ controller: AddContactViewController)
    func addContactViewController(_ controller: AddContactViewController, didFinishAdding item: Contact)
}

class AddContactViewController: UITableViewController {

    // MARK: Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    // MARK: Properties
    
    weak var delegate: AddContactViewControllerDelegate?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: @IBActions
    
    @IBAction func save() {
        let contact = Contact(contactName: nameTextField.text!, phoneNumber: phoneTextField.text!, photo: UIImage(named: "noimage")!)
        delegate?.addContactViewController(self, didFinishAdding: contact)
    }
    
    @IBAction func cancel() {
        delegate?.addContactViewControllerDidCancel(self)
    }
    
    // MARK: UITableViewDelegate Protocol
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
