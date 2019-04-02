//
//  RunningOverlayView.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - RunningOverlayView: Shown when Neural Network is running.
class RunningOverlayView: UIView {
    
    ///MARK: - Instance Properties
    
    //running label
    private let runningLabel = UILabel()
    
    ///MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.85)
        isUserInteractionEnabled = true
        isHidden = true
        loadAnimationView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    ///MARK: - Load Animation View
    
    private func loadAnimationView() {
        //create label
        runningLabel.translatesAutoresizingMaskIntoConstraints = false
        runningLabel.textAlignment = .center
        runningLabel.textColor = UIColor.white
        runningLabel.text = "TRAINING NETWORK"
        runningLabel.font = UIFont.systemFont(ofSize: 22)
        
        //add + constrain
        addSubview(runningLabel)
        runningLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        runningLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    ///MARK: - Set State
    
    func setState(isRunning: Bool) {
        isHidden = !isRunning
    }
    
}
