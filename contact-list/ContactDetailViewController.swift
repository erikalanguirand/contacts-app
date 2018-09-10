//
//  ContactDetailViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

protocol ContactDetailViewControllerDelegate: class {
    func contactDetailViewController(_ controller: ContactDetailViewController, didFinishEditing item: Contact)
}

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
    weak var delegate: ContactDetailViewControllerDelegate?
    
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
    
    // MARK: @IBActions
    
    @IBAction func editContact(_ sender: UIButton) {
        toggleNavigationTitle()
        toggleButtonText()
        toggleLabels()
        toggleTextFields()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let contact = contactData else { return }
        
        guard let updatedName = nameTextField.text else { return }
        contact.contactName = updatedName
        
        guard let updatedPhone = phoneTextField.text else { return }
        contact.phoneNumber = updatedPhone
        
        delegate?.contactDetailViewController(self, didFinishEditing: contact)
    }
}

// MARK: Private Implementation

extension ContactDetailViewController {
    
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
        if navigationItem.title == TitleText.editContact.rawValue {
            navigationItem.title = TitleText.contactDetails.rawValue
        } else {
            navigationItem.title = TitleText.editContact.rawValue
        }
    }
    
    private func toggleButtonText() {
        if editButton.titleLabel?.text == TitleText.editContact.rawValue {
            editButton.setTitle(TitleText.cancelEditing.rawValue, for: .normal)
        } else {
            editButton.setTitle(TitleText.editContact.rawValue, for: .normal)
        }
    }
}

