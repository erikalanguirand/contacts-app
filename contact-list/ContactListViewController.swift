//
//  ViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController, AddContactViewControllerDelegate {
    
    var contactList: [Contact] = []
    var selectedContactIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateContactList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func populateContactList() {
        let contactDatabase = ContactDatabase()
        
        for item in contactDatabase.contacts {
            let newContact = Contact(contactName: item.key, phoneNumber: item.value)
            contactList.append(newContact)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactItem", for: indexPath)
        cell.textLabel?.text = contactList[indexPath.row].nameAndNumber
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            swipeToDelete(indexPath: indexPath)
        }
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        contactList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedContactIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            guard let addContactViewController = segue.destination as? AddContactViewController else { return }
            addContactViewController.delegate = self
        } else if segue.identifier == "ContactDetail" {
            guard let contactDetailViewController = segue.destination as? ContactDetailViewController else { return }
            contactDetailViewController.contactData = contactList[selectedContactIndex]
        }
    }
    
    func addContactViewControllerDidCancel(_ controller: AddContactViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addContactViewController(_ controller: AddContactViewController, didFinishAdding item: Contact) {
        
        let newRowIndex = contactList.count
        contactList.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
}

