//
//  ContactDetailViewController.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    
    var contactData: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contactData = contactData else { return }
        populateData(data: contactData)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func populateData(data: Contact) {
        nameLabel.text = data.contactName
        phoneLabel.text = data.phoneNumber
        contactImageView.image = data.photo
        roundImageView()
    }
    
    func roundImageView() {
        let radius = contactImageView.frame.width/2.0
        contactImageView.layer.cornerRadius = radius
        contactImageView.layer.borderWidth = 1
        contactImageView.layer.borderColor = UIColor.darkGray.cgColor
        contactImageView.layer.masksToBounds = true
    }

}
