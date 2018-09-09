//
//  ContactDetailViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var contactImageView: UIImageView!
    
    // MARK: Properties
    
    var contactData: Contact?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contactData = contactData else { return }
        populateData(data: contactData)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editContact(_ sender: UIButton) {
    }
    
    
    // MARK: Private Implementation
    
    private func populateData(data: Contact) {
        nameLabel.text = data.contactName
        phoneLabel.text = data.phoneNumber
        contactImageView.image = data.photo
        contactImageView.rounded(color: .darkGray)
    }
}
