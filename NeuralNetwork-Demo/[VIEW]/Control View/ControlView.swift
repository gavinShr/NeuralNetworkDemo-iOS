//
//  ControlView.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - Button tags
enum ButtonTag: Int {
    case run = 0
}

///MARK: - Communicates => MainViewHandler
protocol ControlViewDelegate: class {
    func handleButtonPress(_ tag: Int)
}

///MARK: - ControlView: Handles Neural Network control.
class ControlView: UIView {
    
    ///MARK: - Instance Properties
    
    //delegate
    weak var delegate: ControlViewDelegate?
    
    //view elements
    private let runButton = UIButton()
    
    ///MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadControlView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    ///MARK: - Load View
    
    private func loadControlView() {
        loadRunButton()
    }
    
    private func loadRunButton() {
        //create run button
        runButton.translatesAutoresizingMaskIntoConstraints = false
        runButton.layer.cornerRadius = 8
        runButton.layer.borderWidth = 2.5
        runButton.layer.borderColor = UIColor.white.cgColor
        runButton.backgroundColor = CONSTANTS.green
        
        //add + constrain
        addSubview(runButton)
        runButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        runButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        runButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        runButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        //add target
        runButton.tag = ButtonTag.run.rawValue
        runButton.addTarget(self, action: #selector(buttonPressAction(_:)), for: .touchUpInside)
        
        //add label
        addLabelToButton("RUN NETWORK", runButton)
    }
    
    private func addLabelToButton(_ text: String, _ button: UIButton) {
        //create label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = text
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 18)
        
        //add + constrain
        button.addSubview(label)
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    }
    
    ///MARK: - Button press actions
    
    @objc private func buttonPressAction(_ sender: UIButton) {
        let buttonToAnimate = sender.tag == ButtonTag.run.rawValue ? runButton : runButton
        buttonToAnimate.press { [weak self] in self?.delegate?.handleButtonPress(sender.tag) }
    }
    
}
