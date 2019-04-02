//
//  MainViewHandler.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - Communicates => ViewController
protocol MainViewHandlerDelegate: class {
    func handleButtonPress(_ tag: Int)
}

///MARK: - MainViewHandler: Lays out UI for application.
class MainViewHandler {
    
    ///MARK: - Instance Properties
    
    //delegate
    weak var delegate: MainViewHandlerDelegate?
    
    //view elements
    private var view: UIView!
    private var nnView: NeuralNetworkView!
    private var ioView: InputOutputView!
    private var cView: ControlView!
    
    //overlay animation view
    private var overlayView: RunningOverlayView!
    
    ///MARK: - Initialization
    
    init(_ view: UIView) {
        self.view = view
        view.backgroundColor = UIColor.black
        
        addNeuralNetworkView()
        addIOView()
        addControlView()
        addOverlayView()
    }
    
    ///MARK: - Add View Objects
    
    private func addNeuralNetworkView() {
        //create neural network view
        nnView = NeuralNetworkView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        nnView.translatesAutoresizingMaskIntoConstraints = false
        
        //add + constrain
        view.addSubview(nnView)
        nnView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        nnView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nnView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nnView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func addIOView() {
        //create IO view
        ioView = InputOutputView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        ioView.translatesAutoresizingMaskIntoConstraints = false
        
        //add + constrain
        view.addSubview(ioView)
        ioView.topAnchor.constraint(equalTo: nnView.bottomAnchor, constant: 5).isActive = true
        ioView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ioView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ioView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func addControlView() {
        //create control view
        cView = ControlView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.delegate = self
        
        //add + constrain
        view.addSubview(cView)
        cView.topAnchor.constraint(equalTo: ioView.bottomAnchor, constant: 30).isActive = true
        cView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        cView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func addOverlayView() {
        //create overlay view
        overlayView = RunningOverlayView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        //add + constrain
        view.addSubview(overlayView)
        view.bringSubviewToFront(overlayView)
        overlayView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        overlayView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        overlayView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    ///MARK: - State Input
    
    func updateResults(_ results: [Float], _ index: Int) {
        ioView.updateResults(results, index)
        overlayView.setState(isRunning: false)
    }
    
}

///MARK: - Conformance to ControlViewDelegate
extension MainViewHandler: ControlViewDelegate {
    
    func handleButtonPress(_ tag: Int) {
        //set animation overlay state (if applicable)
        if tag == ButtonTag.run.rawValue {
            overlayView.setState(isRunning: true)
        }
        
        //alert delegate
        DispatchQueue.main.async {
            self.delegate?.handleButtonPress(tag)
        }
    }
    
}
