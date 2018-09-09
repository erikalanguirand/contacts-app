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
        guard let data = contactData else { return }
        nameLabel.text = data.contactName
        phoneLabel.text = data.phoneNumber
        contactImageView.image = data.photo
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
