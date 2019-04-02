//
//  NeuralNetworkView.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - NeuralNetworkView: Displays the Neural Network state.
class NeuralNetworkView: UIView {
    
    ///MARK: - Instance Properties
    
    //colors for each layer
    private let inputColor = CONSTANTS.red
    private let hiddenColor = UIColor.white
    private let outputColor = CONSTANTS.blue
    
    //neuron locations / size controls
    private let neuronSize: CGFloat = 12
    private var points = [[CGPoint]]()
    
    //view elements
    private var neurons = [[UIView]]()
    
    ///MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNNView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    ///MARK: - Load View
    
    private func loadNNView() {
        loadPoints()
        loadNeurons()
        loadSynapses()
    }
    
    //load the points (x, y) of each neuron
    private func loadPoints() {
        //load center x positions for each column
        let numCols = NeuralNetworkConstants.numHiddenLayers + 2 //num hidden layers + input + output
        let colWidth = frame.width / CGFloat(numCols)
        var columnCenters = [CGFloat]()
        var columnCenterStartPosition: CGFloat = colWidth / 2
        for _ in 0..<numCols {
            columnCenters.append(columnCenterStartPosition)
            columnCenterStartPosition += colWidth
        }
        
        //load center y positions for each item in each column => append to holding array
        for x in 0..<columnCenters.count {
            //load y positions
            let numRows = x == 0 ? NeuralNetworkConstants.input : x == (columnCenters.count - 1) ? NeuralNetworkConstants.output : NeuralNetworkConstants.hidden
            let rowHeight = frame.height / CGFloat(numRows)
            var rowStartPosition: CGFloat = rowHeight / 2
            
            //load points array input => append to overall points array
            var pointsArrInput = [CGPoint]()
            for _ in 0..<numRows {
                pointsArrInput.append(CGPoint(x: columnCenters[x], y: rowStartPosition))
                rowStartPosition += rowHeight
            }
            points.append(pointsArrInput)
        }
    }
    
    //draw neuron views
    private func loadNeurons() {
        let half: CGFloat = neuronSize / 2
        for x in 0..<points.count {
            var neuronArrayInput = [UIView]()
            for p in points[x] {
                let rect = CGRect(x: p.x - half, y: p.y - half, width: neuronSize, height: neuronSize)
                let neuron = UIView(frame: rect)
                neuron.layer.cornerRadius = half
                neuron.backgroundColor = x == 0 ? inputColor : x == (points.count - 1) ? outputColor : hiddenColor
                addSubview(neuron)
                neuronArrayInput.append(neuron)
            }
            neurons.append(neuronArrayInput)
        }
    }
    
    //draw synapse shape layers
    private func loadSynapses() {
        for x in 0...neurons.count - 2 {
            let neuronArrayCurrent = neurons[x]
            let neuronArrayNext = neurons[x + 1]
            
            let color = x == 0 ? inputColor : x == (neurons.count - 2) ? outputColor : hiddenColor
            
            for nCurrent in neuronArrayCurrent {
                for nNext in neuronArrayNext {
                    drawSynapseBetween(v1: nCurrent, v2: nNext, color: color)
                }
            }
        }
    }
    
    //draw one synapse shape layer between views
    private func drawSynapseBetween(v1: UIView, v2: UIView, color: UIColor) {
        //create shape layer
        let line = CAShapeLayer()
        
        //create path
        let linePath = UIBezierPath()
        linePath.move(to: v1.center)
        linePath.addLine(to: v2.center)
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = 1.5
        line.lineJoin = .round
        
        //add layer
        self.layer.insertSublayer(line, at: 0)
    }
    
}
