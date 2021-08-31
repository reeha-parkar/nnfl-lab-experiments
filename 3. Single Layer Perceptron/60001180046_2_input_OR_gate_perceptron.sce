// Single Layer Perceptron Model for OR Gate with bipolar inputs

// Truth table:
// x1  x2  y
// −1 −1 −1
// −1  1   1
//  1 −1   1
//  1  1   1 

clc ;
clear ;
disp("Reeha Parkar - 60001180046");
disp("2 input OR gate implementation using Single Layer Perceptron");
//Input:
x = [1 1 -1 -1;1 -1 1 -1]; 
//Target output:
t = [1 1 1 -1]; 
//Weights:
w = [0 0]; 
//Bias:
b = 0; 
//Learning rate:
alpha = input("Enter learning rate: "); 
//Threshold:
threshold = input("Enter threshold value: ");
//Number of epochs:
epoch = 0;

flag = 1;


while flag
    
    flag = 0;
    
    for i = 1:4
        
        yin = b + x(1,i)*w(1) + x(2,i)*w(2); // Net input
        
        //Bipolar Step Activation Function:
        if yin > threshold then
            y = 1;
        end
        if yin <= threshold & yin >= -(threshold) then
            y = 0;
        end
        if yin < -(threshold) then
            y = -1;
        end
        
        if y - t(i) then // t=y? condition check
            flag = 1;
            for j = 1:2
                w (j) = w(j) + alpha*t(i)*x(j,i); //Weight Upgrade
            end
            b = b + alpha*t(i); //Bias Upgrade
        end
    end
    epoch = epoch + 1; //Increase epochs
    disp("Epoch Number");
    disp(epoch)
    disp("Weights for this epoch");
    disp(w);
    disp("Bias for this epoch");
    disp(b);
end
disp ("Final parameters of 2 input OR gate perceptron") ;
disp ("Weights:") ;
disp (w);
disp ("Bias:") ;
disp (b);
disp("Number of Epochs:");
disp(epoch);
