//
//  ViewController.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - Main entry view controller.
class ViewController: UIViewController {

    ///MARK: - Instance Properties
    
    private var neuralNetwork: NeuralNetworkHandler!
    private var mainHandler: MainViewHandler!
    
    ///MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIState()
        loadNNHandler()
    }

    ///MARK: - Load Starting State / Handlers
    
    private func loadUIState() {
        mainHandler = MainViewHandler(self.view)
        mainHandler.delegate = self
    }

    private func loadNNHandler() {
        neuralNetwork = NeuralNetworkHandler()
        neuralNetwork.delegate = self
    }
    
}

///MARK: - Conformance to MainViewHandlerDelegate 
extension ViewController: MainViewHandlerDelegate {
    
    func handleButtonPress(_ tag: Int) {
        switch tag {
        case ButtonTag.run.rawValue: neuralNetwork.run()
        default: break
        }
    }
    
}

///MARK: - Conformance to NeuralNetworkHandlerDelegate
extension ViewController: NeuralNetworkHandlerDelegate {
    
    func updateResults(_ results: [Float], _ index: Int) {
        mainHandler.updateResults(results, index)
    }
    
}
