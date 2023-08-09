//
//  ViewController.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 07/08/2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    
    @IBOutlet weak var LoginUserName: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       viewColor()
        placeholderColor()
    }
    
    //Mark:- placeholder color setting
    func placeholderColor() {
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.white, // Change this to your desired color
                ]
        let userNamePlaceholder = NSAttributedString(string: "Username", attributes: attributes)
        let passwordPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        
        LoginUserName.attributedPlaceholder = userNamePlaceholder
        LoginPassword.attributedPlaceholder = passwordPlaceholder
    }
    
    //Mark:- view border color setting
    func viewColor() {
        userView.layer.borderWidth = 1.0
                userView.layer.borderColor = UIColor.white.cgColor
        passwordView.layer.borderWidth = 1.0
                passwordView.layer.borderColor = UIColor.white.cgColor
    }

}

