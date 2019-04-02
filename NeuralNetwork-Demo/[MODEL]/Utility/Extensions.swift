//
//  Extensions.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation
import UIKit

///MARK: - Closed Range used in Neural Network math.
public extension ClosedRange where Bound: FloatingPoint {
    public func random() -> Bound {
        let range = self.upperBound - self.lowerBound
        let randomValue = (Bound(arc4random_uniform(UINT32_MAX)) / Bound(UINT32_MAX)) * range + self.lowerBound
        return randomValue
    }
}

///MARK: - UIButton Extensions
extension UIButton {
    
    //"scale in and back out" button press animation
    func press(completion: @escaping() -> ()) {
        UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseIn], animations: { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { _ in
            UIView.animate(withDuration: 0.125, delay: 0, options: [.curveEaseIn], animations: { [weak self] in
                self?.transform = .identity
            }, completion: { _ in completion() })
        })
    }
    
}

///MARK: - UIColor Extensions
extension UIColor {
    
    //initialize color with hex value
    convenience init(hex:Int, alpha: CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
}
