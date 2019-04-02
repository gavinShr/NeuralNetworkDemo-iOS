//
//  HapticGenerator.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - HapticGenerator: Handle haptic feedback across application.
class HapticGenerator {
    
    ///MARK: - Static Properties
    
    static let hapticGenerator = UIImpactFeedbackGenerator(style: .light)
    static let errorGenerator = UINotificationFeedbackGenerator()
    
    ///MARK: - Apply Haptic Feedback
    
    static func applyHaptics() {
        HapticGenerator.hapticGenerator.impactOccurred()
        HapticGenerator.hapticGenerator.prepare()
    }
    
    static func applyHapticsFancy(_ style: UINotificationFeedbackGenerator.FeedbackType) {
        HapticGenerator.errorGenerator.notificationOccurred(style)
        HapticGenerator.errorGenerator.prepare()
    }
    
}
