//
//  ViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactItem", for: indexPath)
        
        cell.textLabel?.text = "Some Stuff"
        cell.accessoryType = .none
        
        return cell
        
    }
    
    func populateContactList() {
        let contactDatabase = ContactDatabase()
        
        for item in contactDatabase.contacts {
            let newContact = Contact(contactName: item.key, phoneNumber: item.value)
            contactList.append(newContact)
        }
    }
}

