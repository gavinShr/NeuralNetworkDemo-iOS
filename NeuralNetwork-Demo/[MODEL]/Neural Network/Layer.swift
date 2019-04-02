//
//  Layer.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation

///MARK: - Layer: A class that handles one "layer" of the NeuralNetwork.
class Layer {
    
    ///MARK: - Instance Properties
    
    private var output: [Float]
    private var input: [Float]
    private var weights: [Float]
    private var previousWeights: [Float]
    
    ///MARK: - Layer Initialization
    
    init(inputSize: Int, outputSize: Int) {
        self.output = [Float](repeating: 0, count: outputSize)
        self.input = [Float](repeating: 0, count: inputSize + 1)
        self.weights = (0..<(1 + inputSize) * outputSize).map { _ in
            return (-2.0...2.0).random()
        }
        previousWeights = [Float](repeating: 0, count: weights.count)
    }
    
    ///MARK: - Getters
    
    func getOutput() -> [Float] {
        return output
    }
    
    ///MARK: - Layer Control Functions
    
    public func run(inputArray: [Float]) -> [Float] {
        for i in 0..<inputArray.count {
            input[i] = inputArray[i]
        }
        
        input[input.count-1] = 1
        var offSet = 0
        
        for i in 0..<output.count {
            for j in 0..<input.count {
                output[i] += weights[offSet+j] * input[j]
            }
            
            output[i] = SigmoidActivation.sigmoid(x: output[i])
            offSet += input.count
            
        }
        
        return output
    }
    
    public func train(error: [Float]) -> [Float] {
        var offset = 0
        var nextError = [Float](repeating: 0, count: input.count)
        
        for i in 0..<output.count {
            let delta = error[i] * SigmoidActivation.sigmoidDerivative(x: output[i])
            
            for j in 0..<input.count {
                let weightIndex = offset + j
                nextError[j] = nextError[j] + weights[weightIndex] * delta
                let dw = input[j] * delta * NeuralNetworkConstants.rate
                weights[weightIndex] += previousWeights[weightIndex] * NeuralNetworkConstants.momentum + dw
                previousWeights[weightIndex] = dw
            }
            
            offset += input.count
        }
        
        return nextError
    }
}
