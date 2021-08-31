clear ;
clc ;
// Generate weights and threshold value
disp("60001180046 - Reeha Parkar");
disp("4 input AND Gate McCulloch Pitts Model")

// Weights
w = [1 1 1 1];

x = [0 0 0 0 0 0 0 0 1 1 1 1; 0 0 0 0 1 1 1 1 0 0 0 1; 0 0 1 1 0 0 0 1 0 0 1 1; 0 1 0 1 0 1 0 1 0 1 0 1];

threshold = input("Enter threshold value ");

y =[0 0 0 0 0 0 0 0];

expected_output = [0 0 0 0 0 0 0 0 0 0 0 1];

flag = 1 // will check if the output matches, and iterate till it does 
while flag
    for i = 1:12
        zin = x(1,i)*w(1) + x(2,i)*w(2) + x(3,i)*w(3) + x(4,i)*w(4);
        if zin >= threshold
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
    
    disp ('Outputs') ;
    disp("zin = ");
    disp(zin);
    disp ("y = ");
    disp(y);
    
    if y == expected_output
        disp("Output matches!");
        flag = 0;
    else
        disp ("Output does not match so change the threshold");
        threshold = input("Enter threshold value ");
    end
end

disp("Final McCulloch Pitts 4 input AND Gate Model Parameters:");
disp("Weights: ");
disp(w);
disp("Threshold: ");
disp(threshold);

//Testing
disp("Enter 4 bit input");
for i = 1:4
    test_x(i) = input("");
end

test_x = test_x';
test_zin = test_x(1)*w(1) + test_x(2)*w(2) + test_x(3)*w(3) + test_x(4)*w(4);
test_y = 0;
for i = 1:4
    if test_zin  >= threshold
        test_y = 1;
    else
        test_y = 0;
    end
end

// Final Output:
disp("Final AND output of the Model is:");
disp(test_y);
