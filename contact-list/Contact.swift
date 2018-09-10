//
//  Contact.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import Foundation
import UIKit

class Contact: NSObject {
    
    var contactName: String
    var phoneNumber: String
    var photo: UIImage
    
    init(contactName: String, phoneNumber: String, photo: UIImage) {
        self.contactName = contactName
        self.phoneNumber = phoneNumber
        self.photo = photo
    }
    
    var nameAndNumber: String {
        return "\(contactName) \(phoneNumber)"
    }
}


