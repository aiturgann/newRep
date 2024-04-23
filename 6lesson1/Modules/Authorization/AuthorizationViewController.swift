//
//  AuthorizationViewController.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 23/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ваше имя"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 16
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        textField.placeholder = "Введите ваш номер телефона"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 16
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                nameTextField.heightAnchor.constraint(equalToConstant: 50),
                
                phoneNumberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
                phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
                
                signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    @objc
    private func signInTap() {
        guard
            let name = nameTextField.text, !name.isEmpty,
            let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty 
        else {
            return
        }
        UserSessionManager.shared.saveSession(
            with: name,
            phoneNumber: phoneNumber
        )
    }
}
