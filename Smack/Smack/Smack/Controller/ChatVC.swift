//
//  ChatVC.swift
//  Smack
//
//  Created by piatkovskyi on 11/28/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMenuBtn()
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            })
        }
    }
    
    private func setupMenuBtn() {
        self.menuBtn.addTarget(self, action: #selector(menuBtnAction), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    @objc private func menuBtnAction() {
        self.revealViewController()?.revealToggle(UIButton())
    }
}
