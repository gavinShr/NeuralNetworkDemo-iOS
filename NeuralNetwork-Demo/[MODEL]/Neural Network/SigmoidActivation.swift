//
//  SigmoidActivation.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation

///MARK: - SigmoidActivation: A class that handles the "sigmoid" activation function and derivative. These functions are used to calculate the stochastic gradient descent for forward propagation, and the derivative of this function for back propagation.
class SigmoidActivation {
    
    //activation function (forward propagation)
    static func sigmoid(x: Float) -> Float {
        return 1 / (1 + exp(-x))
    }
    
    //derivative of action function (backwards propagation)
    static func sigmoidDerivative(x: Float) -> Float {
        return x * (1 - x)
    }
    
}


