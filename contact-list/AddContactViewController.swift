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

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    weak var delegate: AddContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func save() {
        let contact = Contact(contactName: nameTextField.text!, phoneNumber: phoneTextField.text!)
        delegate?.addContactViewController(self, didFinishAdding: contact)
    }
    
    @IBAction func cancel() {
        delegate?.addContactViewControllerDidCancel(self)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
