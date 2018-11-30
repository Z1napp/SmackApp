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
    @IBOutlet weak var channelNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMenuBtn()
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelSelected), name: NOTIF_CHANNEL_SELECTED, object: nil)

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
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            self.onLoginGetMessages()
        } else {
            self.channelNameLbl.text = "Please Log In"
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        self.updateWithChannel()
    }
    
    func updateWithChannel() {
        self.channelNameLbl.text = "#\(MessageService.instance.selectedChannel?.channelTitle ?? "")"
    }
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannels { (success) in
            if success {
                // Do stuff with channels
            }
        }
    }
}


