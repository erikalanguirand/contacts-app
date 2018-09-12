//
//  Contact.swift
//  contact-list
//
//  Created by Erika Carlson on 9/8/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import Foundation
import UIKit

class Contact: NSObject, Codable {
    
    var contactName: String
    var phoneNumber: String
    
    init(contactName: String, phoneNumber: String) {
        self.contactName = contactName
        self.phoneNumber = phoneNumber
    }
    
    var nameAndNumber: String {
        return "\(contactName) \(phoneNumber)"
    }
}


