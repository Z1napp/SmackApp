//
//  AddChannelVC.swift
//  Smack
//
//  Created by piatkovskyi on 11/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var decriptionTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else { return }
        guard let channelDesc = decriptionTxt.text, decriptionTxt.text != "" else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView() {
        nameTxt.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        decriptionTxt.attributedPlaceholder = NSAttributedString(string: "Decription", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(handleCloseTouch))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    
    @objc func handleCloseTouch() {
        dismiss(animated: true, completion: nil)
    }
}
