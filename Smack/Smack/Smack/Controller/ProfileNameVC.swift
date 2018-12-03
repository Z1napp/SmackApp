//
//  ProfileNameVC.swift
//  Smack
//
//  Created by piatkovskyi on 12/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ProfileNameVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    @IBAction func dismissBtnPressed(_ sender: Any) {
        self.handleCloseTouch()
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        AuthService.instance.changeName(username: self.nameTxt.text ?? "Anonymous") { (success) in
            if success {
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                self.nameTxt.text = ""
                self.handleCloseTouch()
            }
        }
    }
    
    func setupView() {
        nameTxt.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(handleCloseTouch))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    
    @objc func handleCloseTouch() {
        dismiss(animated: true, completion: nil)
    }
}
