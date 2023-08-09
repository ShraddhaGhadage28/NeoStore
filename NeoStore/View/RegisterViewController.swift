//
//  RegisterViewController.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 08/08/2023.
//

import UIKit

class RegisterViewController: UIViewController {

   
    @IBOutlet weak var FirstNameView: UIView!
    @IBOutlet weak var LastNameView: UIView!
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var PasswordView: UIView!
    @IBOutlet weak var ConfirmPasswordView: UIView!
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor()
        placeholderColor()
        // Do any additional setup after loading the view.
    }
    
    func viewColor() {
        FirstNameView.layer.borderWidth = 1.0
                FirstNameView.layer.borderColor = UIColor.white.cgColor
        LastNameView.layer.borderWidth = 1.0
                LastNameView.layer.borderColor = UIColor.white.cgColor
        EmailView.layer.borderWidth = 1.0
                EmailView.layer.borderColor = UIColor.white.cgColor
        PasswordView.layer.borderWidth = 1.0
                PasswordView.layer.borderColor = UIColor.white.cgColor
        ConfirmPasswordView.layer.borderWidth = 1.0
                ConfirmPasswordView.layer.borderColor = UIColor.white.cgColor
        phoneView.layer.borderWidth = 1.0
        phoneView.layer.borderColor = UIColor.white.cgColor
    }

    func placeholderColor() {
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.white, // Change this to your desired color
                ]
        let firstNamePlaceholder = NSAttributedString(string: "First Name", attributes: attributes)
        let lastNamePlaceholder = NSAttributedString(string: "Last Name", attributes: attributes)
        let emailPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        let passwordPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        let confirmPasswordPlaceholder = NSAttributedString(string: "Confirm Password", attributes: attributes)
        let phonePlaceholder = NSAttributedString(string: "Phone Number", attributes: attributes)
        FirstName.attributedPlaceholder = firstNamePlaceholder
        LastName.attributedPlaceholder = lastNamePlaceholder
        Email.attributedPlaceholder = emailPlaceholder
        Password.attributedPlaceholder = passwordPlaceholder
        confirmPassword.attributedPlaceholder = confirmPasswordPlaceholder
        phoneNumber.attributedPlaceholder = phonePlaceholder
    }
    

}
