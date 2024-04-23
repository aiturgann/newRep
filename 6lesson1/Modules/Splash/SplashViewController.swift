//
//  SplashViewController.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 23/4/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserSessionManager.shared.isSessionActive {
            let viewController = UserViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let viewController = AuthorizationViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
