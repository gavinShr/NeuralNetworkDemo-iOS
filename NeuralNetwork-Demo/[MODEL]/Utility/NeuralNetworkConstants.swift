//
//  NeuralNetworkConstants.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import Foundation

///MARK: - NeuralNetworkConstants: A structure containing static variables that control the NeuralNetwork learning rate, # iterations, momentum, size, etc...
struct NeuralNetworkConstants {
    
    //"Learning" Controls
    static let rate: Float = 0.3        //delta error modifier
    static let momentum: Float = 0.6    //weight modifier
    static let iterations: Int = 10000  //# iterations to run through
    
    //Network Size Controls
    static let input: Int = 2
    static let hidden: Int = 5
    static let numHiddenLayers: Int = 3
    static let output: Int = 1
    
    //Neural Network Training Data
    static let traningData: [[Float]] = [[0, 0], [0, 1], [1, 0], [1, 1]]
    static let traningResults: [[Float]] = [[0], [0], [0], [1]]
}
