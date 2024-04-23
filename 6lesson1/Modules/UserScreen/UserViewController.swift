//
//  UserViewController.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 23/4/24.
//

import UIKit

class UserViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "surname"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "phone"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(phoneNumberLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                nameLabel.heightAnchor.constraint(equalToConstant: 50),
                
                surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
                surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                surnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                surnameLabel.heightAnchor.constraint(equalToConstant: 50),
                
                phoneNumberLabel.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 50),
                phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                phoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                phoneNumberLabel.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}
