//
//  ViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    // MARK: Properties
    
    var contactList: [Contact] = []
    var selectedContactIndex = 0
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
        populateContactList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Contacts.plist")
    }
    
    func saveContacts() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(contactList)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            } catch {
                print("Error encoding item array!")
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.addContactSegueIdentifier.rawValue {
            guard let addContactViewController = segue.destination as? AddContactViewController else { return }
            addContactViewController.delegate = self
            
        } else if segue.identifier == SegueIdentifier.contactDetailSegueIdentifier.rawValue {
            guard let contactDetailViewController = segue.destination as? ContactDetailViewController else { return }
            contactDetailViewController.contactData = contactList[selectedContactIndex]
            contactDetailViewController.delegate = self
        }
        
    }
}

// MARK: Private Implementation

extension ContactListViewController {
    
    private func populateContactList() {
        let contactDatabase = ContactDatabase()
        
        for item in contactDatabase.contacts {
            let newContact = Contact(contactName: item.key, phoneNumber: item.value)
            contactList.append(newContact)
        }
    }
    
    private func swipeToDelete(indexPath: IndexPath) {
        contactList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    private func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
    
// MARK: UITableViewDataSource Protocol

extension ContactListViewController {
    
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
}
    
//MARK: UITableViewDelegate Protocol

extension ContactListViewController {
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedContactIndex = indexPath.row
        return indexPath
    }
}

// MARK: AddContactViewControllerDelegate Protocol

extension ContactListViewController: AddContactViewControllerDelegate {
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

// MARK: ContactListViewControllerDelegate Protocol

extension ContactListViewController: ContactDetailViewControllerDelegate {
    
    func contactDetailViewController(_ controller: ContactDetailViewController, didFinishEditing item: Contact) {
        
        guard let index = contactList.index(of: item) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.textLabel?.text = item.nameAndNumber
        navigationController?.popViewController(animated: true)
    }
    
}
