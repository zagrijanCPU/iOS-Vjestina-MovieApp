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
    var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildComponents()
        positionComponents()
        styleComponents()
    }
    
    private func buildComponents(){
        loginLabel = UILabel()
        view.addSubview(loginLabel)
        
        userNameTextField = UITextField()
        view.addSubview(userNameTextField)
        
        passwordTextField = UITextField()
        view.addSubview(passwordTextField)
        
        submitButton = UIButton(type: .custom)
        view.addSubview(submitButton)
    }
    
    private func positionComponents(){
        
        loginLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        userNameTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        submitButton.autoAlignAxis(toSuperviewAxis: .vertical)
        
        passwordTextField.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        userNameTextField.autoPinEdge(.bottom, to: .top, of: passwordTextField, withOffset: -20)
        loginLabel.autoPinEdge(.bottom, to: .top, of: userNameTextField, withOffset: -40)
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 20)
        
        passwordTextField.autoSetDimension(.width, toSize: view.bounds.width / 1.5)
        userNameTextField.autoMatch(.width, to: .width, of: passwordTextField)
        
    }
    
    private func styleComponents(){
        
        loginLabel.text = "Login"
        loginLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.placeholder = "Username"
        userNameTextField.layer.cornerRadius = 10
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.layer.borderWidth = 1.0
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1.0
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        submitButton.layer.cornerRadius = 10
        
    }
}
