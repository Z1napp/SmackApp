//
//  MessageCell.swift
//  Smack
//
//  Created by piatkovskyi on 11/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message) {
        self.userImg.image = UIImage(named: message.userAvatar)
        self.userImg.backgroundColor = UserDataService.instance.returnUiColor(components: message.userAvatarColor)
        self.userNameLbl.text = message.userName
        self.messageBodyLbl.text = message.message
        self.timeStampLbl.text = ""
    }
}
