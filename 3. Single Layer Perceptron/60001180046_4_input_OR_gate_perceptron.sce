
// Single Layer Perceptron Model for 4 input OR Gate with bipolar inputs

clc ;
clear ;
disp("Reeha Parkar - 60001180046");
disp("4 input OR gate implementation using Single Layer Perceptron");

//Training:
//Input
x =[1 1 1 1 1 1 1 1 -1 -1 -1 -1; 1 1 1 1 -1 -1 -1 -1 1 -1 -1 -1; 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1; 1 -1 1 -1 1 -1 1 -1 -1 1 1 -1]; 
//Target output:
t =[1 1 1 1 1 1 1 1 1 1 1 -1]; 
//Weights:
w =[0 0 0 0]; 
//Bias:
b = 0; 
//Learning Rate:
alpha = input("Enter learning rate: "); 
//Threshold value:
threshold = input("Enter threshold value: "); 

//Number of epochs:
epoch = 0;

flag = 1;

while flag
    flag = 0;
    
    for i =1:12
        
        yin = b + x(1,i)*w(1) + x(2,i)*w(2)+ x(3,i)*w(3) + x(4,i)*w(4); // Net input
        
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
            for j = 1:4
                w(j) = w(j) + alpha*t(i)*x(j,i); //Weight Upgrade
         end
            b = b + alpha*t(i); //Bias Upgrade
        end
    end
    epoch = epoch + 1; //Increase epochs
    disp("Epoch Number");
    disp(epoch);
    disp("Weights for this epoch");
    disp(w);
    disp("Bias for this epoch");
    disp(b);
end
disp ("Final parameters of 4 input OR gate perceptron");
disp ("Weights:");
disp (w);
disp ("Bias:");
disp (b);
disp("Total Number of Epochs:");
disp(epoch);

//Testing
disp("Enter 4 bit input");
for i = 1:4
    test_x(i) = input("");
end

test_x = test_x';
test_zin = test_x(1)*w(1) + test_x(2)*w(2) + test_x(3)*w(3) + test_x(4)*w(4);
test_y = 0;
disp("Test net input is: ");
disp(test_zin);

for i =1:4
    
    //Bipolar Activation Function:
    if test_zin > threshold then
        test_y = 1;
    end
    if test_zin <= threshold & test_zin >= -(threshold) then
        test_y = 0;
    end
    if test_zin < -(threshold) then
        test_y = -1;
    end 
end

disp("Final output for Single layer perceptron model for the given input is:");
disp(test_y);


