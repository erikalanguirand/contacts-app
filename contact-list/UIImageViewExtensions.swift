//
//  UIImageViewExtensions.swift
//  contact-list
//
//  Created by Erika Carlson on 9/9/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func rounded(color: UIColor) {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
}
