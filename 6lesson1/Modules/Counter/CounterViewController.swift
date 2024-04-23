//
//  CounterViewController.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 22/4/24.
//

import UIKit

class CounterViewController: UIViewController {
    
    private let counterView: CounterView = {
        let view = CounterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var counter = CounterModel(number: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        counterView.delegate = self
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(counterView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                counterView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                counterView.heightAnchor.constraint(equalToConstant: 56),
                counterView.widthAnchor.constraint(equalToConstant: 250)
            ]
        )
    }
}

extension CounterViewController: CounterViewDelegate {
    func increaseTap() {
        counter.number += 1
        counterView.fill(with: counter)
        Logger.shared.increaseLog(with: counter.number)
    }
    
    func decreaseTap() {
        counter.number -= 1
        counterView.fill(with: counter)
        Logger.shared.decreaseLog(with: counter.number)
    }
}
