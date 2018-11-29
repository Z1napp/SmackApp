//
//  CircleImage.swift
//  Smack
//
//  Created by piatkovskyi on 11/29/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
}
