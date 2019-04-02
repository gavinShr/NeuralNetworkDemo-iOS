//
//  InputOutputView.swift
//  NeuralNetwork-Demo
//
//  Created by Gavin Shrader on 4/1/19.
//  Copyright © 2019 Gavin Shrader. All rights reserved.
//

import UIKit

///MARK: - InputOutputView: Displays the input/output expected results and the current results from the network
class InputOutputView: UIView {
    
    ///MARK: - Instance Properties
    
    //view elements
    private var titles = [UILabel]()
    private var inputs = [UILabel]()
    private var expected = [UILabel]()
    private var results = [UILabel]()
    
    ///MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadIOView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    ///MARK: - State Input
    
    func updateResults(_ results: [Float], _ index: Int) {
        let result = round(results[0] * pow(10.0, Float(4))) / pow(10.0, Float(4))
        self.results[index].text = "\(result)"
    }
    
    ///MARK: - Load View
    
    private func loadIOView() {
        loadTitleLabels()
        loadInputLabels()
        loadExpectedLabels()
        loadResultLabels()
    }
    
    private func loadTitleLabels() {
        for x in 0...2 {
            //create labels
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = x == 0 ? .left : x == 1 ? .center : .right
            label.textColor = x == 0 ? CONSTANTS.red : x == 1 ? CONSTANTS.green : CONSTANTS.blue
            label.text = x == 0 ? "INPUT" : x == 1 ? "EXPECTED" : "RESULTS"
            label.font = UIFont.systemFont(ofSize: 18)
            
            //add + constrain
            addSubview(label)
            label.topAnchor.constraint(equalTo: topAnchor).isActive = true
            if x == 0 {
                label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
            } else if x == 1 {
                label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            } else {
                label.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
            }
            
            //append to array
            titles.append(label)
        }
    }
    
    private func loadInputLabels() {
        for inputItem in NeuralNetworkConstants.traningData {
            //create label
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .left
            label.textColor = CONSTANTS.red
            label.text = "\(inputItem)"
            label.font = UIFont.systemFont(ofSize: 15)
            
            //add + constrain
            addSubview(label)
            label.leftAnchor.constraint(equalTo: titles[0].leftAnchor).isActive = true
            if let last = inputs.last {
                label.topAnchor.constraint(equalTo: last.bottomAnchor).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: titles[0].bottomAnchor).isActive = true
            }
        
            //append to array
            inputs.append(label)
        }
    }
    
    private func loadExpectedLabels() {
        for expectedItem in NeuralNetworkConstants.traningResults {
            //create label
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = CONSTANTS.green
            label.text = "\(expectedItem)"
            label.font = UIFont.systemFont(ofSize: 15)
            
            //add + constrain
            addSubview(label)
            label.centerXAnchor.constraint(equalTo: titles[1].centerXAnchor).isActive = true
            if let last = expected.last {
                label.topAnchor.constraint(equalTo: last.bottomAnchor).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: titles[1].bottomAnchor).isActive = true
            }
            
            //append to array
            expected.append(label)
        }
    }
    
    private func loadResultLabels() {
        for _ in NeuralNetworkConstants.traningResults {
            //create label
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .right
            label.textColor = CONSTANTS.blue
            label.text = "---"
            label.font = UIFont.systemFont(ofSize: 15)
            
            //add + constrain
            addSubview(label)
            label.rightAnchor.constraint(equalTo: titles[2].rightAnchor).isActive = true
            if let last = results.last {
                label.topAnchor.constraint(equalTo: last.bottomAnchor).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: titles[2].bottomAnchor).isActive = true
            }
            
            //append to array
            results.append(label)
        }
    }
    
}
