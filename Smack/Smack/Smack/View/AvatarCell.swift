//
//  AvatarCell.swift
//  Smack
//
//  Created by piatkovskyi on 11/29/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == .dark {
          avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
