//
//  ProfileVC.swift
//  Smack
//
//  Created by piatkovskyi on 11/29/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        username.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUiColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(handleCloseTouch))
        bgView.addGestureRecognizer(closeTouch)
        
        let nameTouch = UITapGestureRecognizer(target: self, action: #selector(handleNameTouch))
        self.username.addGestureRecognizer(nameTouch)
        self.username.isUserInteractionEnabled = true
    }
    
    @objc func handleCloseTouch() {
        dismiss(animated: true, completion: nil)
    }

    @objc func handleNameTouch() {
        let nameVC = ProfileNameVC()
        nameVC.modalPresentationStyle = .custom
        present(nameVC, animated: true, completion: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        self.setupView()
    }
}
