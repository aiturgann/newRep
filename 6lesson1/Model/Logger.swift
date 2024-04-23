//
//  Logger.swift
//  6lesson1
//
//  Created by Aiturgan Kurmanbekova on 23/4/24.
//

import Foundation

final class Logger {
    
    static let shared = Logger()
    
    private init() { }
    
    func increaseLog(with number: Int) {
        print("increase tapped with: \(number)")
    }
    
    func decreaseLog(with number: Int) {
        print("decrease tapped with: \(number)")
    }
}
