//
//  NeuralNetwork.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation

///MARK: - NeuralNetwork: A class that handles the overall creation, training and inference within the NeuralNetwork.
class NeuralNetwork {
    
    ///MARK: - Instance Properties
    
    private var layers: [Layer] = []
    
    ///MARK: - Network Initialization
    
    public init(inputSize: Int, hiddenSize: Int, outputSize: Int, numHidden: Int) {
        self.layers.append(Layer(inputSize: inputSize, outputSize: hiddenSize))
        
        for _ in 0..<numHidden {
            self.layers.append(Layer(inputSize: hiddenSize, outputSize: hiddenSize))
        }
        
        self.layers.append(Layer(inputSize: hiddenSize, outputSize: outputSize))
    }
    
    ///MARK: - Get Layers
    
    func getLayers() -> [Layer] {
        return layers
    }
    
    ///MARK: - Network Control Functions
    
    public func run(input: [Float]) -> [Float] {
        var activations = input
        
        for i in 0..<layers.count {
            activations = layers[i].run(inputArray: activations)
        }
        
        return activations
    }
    
    public func train(input: [Float], targetOutput: [Float]) {
        let calculatedOutput = run(input: input)
        var error = zip(targetOutput, calculatedOutput).map { $0 - $1 }
        for i in (0...layers.count-1).reversed() {
            error = layers[i].train(error: error)
        }
        
    }
    
}


