//
//  LoginViewController.swift
//  MovieApp
//
//  Created by endava on 06.04.2024..
//

import Foundation
import UIKit
import PureLayout

class LoginViewController: UIViewController {
    
    var userNameTextField: UITextField!
    var passwordTextField: UITextField!
    var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildComponents()
        positionComponents()
    }
    
    private func buildComponents(){
        userNameTextField = UITextField()
        view.addSubview(userNameTextField)
        
        passwordTextField = UITextField()
        view.addSubview(passwordTextField)
        
        submitButton = UIButton(type: .custom)
        view.addSubview(submitButton)
    }
    
    private func positionComponents(){
        userNameTextField.autoPinEdge(.bottom, to: .top, of: passwordTextField, withOffset: -20)
        userNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        userNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.placeholder = "Username"
        userNameTextField.layer.cornerRadius = 10
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.layer.borderWidth = 1.0
        
        passwordTextField.autoPinEdge(.top, to: .top, of: view, withOffset: view.bounds.height / 2)
        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1.0
        
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 20)
        submitButton.autoPinEdge(.left, to: .left, of: passwordTextField)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        submitButton.layer.cornerRadius = 10
        
    }
}
