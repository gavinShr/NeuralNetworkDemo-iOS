# NeuralNetworkDemo-iOS
A very simple GUI and working Neural Network built in Swift 4

This project is built to demonstrate the Model-View-Controller architecture, an implementation of delegation for handing off responsibilities from one class to another, and a simple multi-layer Neural Network.

// - Neural Network Information

This size of the Neural Network (including the number of inputs, hidden layers, nodes per hidden layer, and the number of outputs) can be changed via the structure named "NeuralNetworkConstants". Inside this file you can also find variables that control the number of iterations, learning rate, momentum and training data. 

Here is some more information about each of these variables, and their effect on the Neural Network.
-Learning Rate: A small positive value, often in the range between 0.0 to 1.0, that indicates the amount that the "weights" of each layer are updated during training.
-Momentum: Previous changes in the value of the "weights" should influence the current direction of movement within these values. "the weight delta equals the learning rate times the gradient, plus a momentum factor times the weight delta from the previous iteration." (https://visualstudiomagazine.com/articles/2017/08/01/neural-network-momentum.aspx)
-Training Data: A multi-dimensional array of inputs to the Neural Network.
-Training Results: A multi-dimensional array consisting of the correct outputs for each input within the Neural Network.
