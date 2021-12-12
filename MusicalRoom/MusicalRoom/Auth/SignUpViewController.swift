//
//  SignUpViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "phone"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatPasswordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .done
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self,action: #selector(signupButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setBackground()
        setUI()
    }
    
    func setBackground(){
        let background = UIImage(named: "signup-bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setUI() {
        // NAME
        view.addSubview(nameField)
        view.addConstraint(NSLayoutConstraint(item: nameField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // PHONE
        view.addSubview(phoneField)
        view.addConstraint(NSLayoutConstraint(item: phoneField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 40).isActive = true
        phoneField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(phoneLabel)
        phoneLabel.bottomAnchor.constraint(equalTo: phoneField.topAnchor, constant: -5).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // USERNAME
        view.addSubview(usernameField)
        view.addConstraint(NSLayoutConstraint(item: usernameField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        usernameField.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 40).isActive = true
        usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(usernameLabel)
        usernameLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -5).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
       
        // PASSWORD
        view.addSubview(passwordField)
        view.addConstraint(NSLayoutConstraint(item: passwordField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 40).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(passwordLabel)
        passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -5).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // REPEAT PASSWORD
        view.addSubview(repeatPasswordField)
        view.addConstraint(NSLayoutConstraint(item: repeatPasswordField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        repeatPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40).isActive = true
        repeatPasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(repeatPasswordLabel)
        repeatPasswordLabel.bottomAnchor.constraint(equalTo: repeatPasswordField.topAnchor, constant: -5).isActive = true
        repeatPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // BUTTON
        view.addSubview(signupButton)
        signupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        view.addConstraint(NSLayoutConstraint(item: signupButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func signupButtonTapped() {
        print("Kek")
    }
}
