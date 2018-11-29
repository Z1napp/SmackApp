//
//  UserDataService.swift
//  Smack
//
//  Created by piatkovskyi on 11/29/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    func setUserData(id: String,avatarColor: String, name: String, avatarName: String, email: String) {
        self.id = id
        self.name = name
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
