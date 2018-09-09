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
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var contactImageView: UIImageView!
    
    // MARK: Properties
    
    var contactData: Contact?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contactData = contactData else { return }
        populateData(data: contactData)
        toggleTextFields()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editContact(_ sender: UIButton) {
        
        toggleNavigationTitle()
        toggleButtonText()
        toggleLabels()
        toggleTextFields()
    }
    
    // MARK: Private Implementation
    
    private func populateData(data: Contact) {
        nameLabel.text = data.contactName
        phoneLabel.text = data.phoneNumber
        contactImageView.image = data.photo
        contactImageView.rounded(color: .darkGray)
    }
    
    private func toggleLabels() {
        nameLabel.isHidden = !nameLabel.isHidden
        phoneLabel.isHidden = !phoneLabel.isHidden
    }
    
    private func toggleTextFields() {
        nameTextField.isHidden = !nameTextField.isHidden
        phoneTextField.isHidden = !phoneTextField.isHidden
    }
    
    private func toggleNavigationTitle() {
        if navigationItem.title == "Edit Contact" {
            navigationItem.title = "Contact Details"
        } else {
            navigationItem.title = "Edit Contact"
        }
    }
    
    private func toggleButtonText() {
        if editButton.titleLabel?.text == "Edit Contact" {
            editButton.setTitle("Cancel Editing", for: .normal)
        } else {
            editButton.setTitle("Edit Contact", for: .normal)
        }
    }
}
