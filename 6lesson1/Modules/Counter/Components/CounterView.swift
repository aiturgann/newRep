//
//  CounterView.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 22/4/24.
//

import UIKit

protocol CounterViewDelegate: AnyObject {
     func increaseTap()
     func decreaseTap()
}

class CounterView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Увеличить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уменьшить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: CounterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        stackView.backgroundColor = .gray
        stackView.layer.cornerRadius = 16
        
        increaseButton.addTarget(self, action: #selector(increaseTap), for: .touchUpInside)
        
        decreaseButton.addTarget(self, action: #selector(decreaseTap), for: .touchUpInside)
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(increaseButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
    
    @objc
    private func increaseTap() {
        delegate?.increaseTap()
    }
    
    @objc
    private func decreaseTap() {
        delegate?.decreaseTap()
    }
    
    func fill(with item: CounterModel) {
        titleLabel.text = String(item.number)
    }
}
