//
//  ForgotPasswordViewController.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 09/08/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var Email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor()
        placeholderColor()
    }
    
    func placeholderColor() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white, // Change this to your desired color
        ]
        let emailPlaceholder = NSAttributedString(string: "E-mail", attributes: attributes)
        Email.attributedPlaceholder = emailPlaceholder
    }
    
    func viewColor() {
        EmailView.layer.borderWidth = 1.0
                EmailView.layer.borderColor = UIColor.white.cgColor
    }


}
