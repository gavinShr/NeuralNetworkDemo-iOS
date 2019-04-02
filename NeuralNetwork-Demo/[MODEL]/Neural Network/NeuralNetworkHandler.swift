//
//  NeuralNetworkHandler.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation

///MARK: - Communicates => ViewController
protocol NeuralNetworkHandlerDelegate: class {
    func updateResults(_ results: [Float], _ index: Int)
}

///MARK: - NeuralNetworkHandler: A class that handles the NeuralNetwork overall control. (Start, Run, Reset, etc...)
class NeuralNetworkHandler {
    
    ///MARK: - Instance Properties
    
    //delegate
    weak var delegate: NeuralNetworkHandlerDelegate?
    
    ///MARK: - Neural Network Control Functions
    
    //run the neural network through training data for <NeuralNetworkConstants.iterations> # iterations
    func run() {
        //create Neural Network
        let NN = NeuralNetwork(inputSize: NeuralNetworkConstants.input, hiddenSize: NeuralNetworkConstants.hidden, outputSize: NeuralNetworkConstants.output, numHidden: NeuralNetworkConstants.numHiddenLayers)
        
        //iterate through Neural Network => train
        for x in 0..<NeuralNetworkConstants.iterations {
            for i in 0..<NeuralNetworkConstants.traningResults.count {
                NN.train(input: NeuralNetworkConstants.traningData[i], targetOutput: NeuralNetworkConstants.traningResults[i])
            }
            
            for i in 0..<NeuralNetworkConstants.traningResults.count {
                let t = NeuralNetworkConstants.traningData[i]
                if x == NeuralNetworkConstants.iterations - 1 {
                    //last iteration => alert delegate
                    delegate?.updateResults(NN.run(input: t), i)
                } else {
                    let _ = NN.run(input: t)
                }
            }
            
        }

    }
    
}
