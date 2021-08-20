clc;
clear all;

x = [0 0 1 1; 0 1 0 1];
t = [0 1 1 1];
w = [1 1];

printf("Two input OR Gate: Reeha Parkar (60001180046)");

threshold = input("Enter threshold value ");

for i = 1:4
    yin = x(1,i)*w(1) + x(2,i)*w(2);
    printf("The net input %d is %d\n", i, yin);
    
    if yin >= threshold
        y = 1;
        if y == t(i)
            continue;
        else
            threshold = threshold + 1;
        end
    end
end

printf("Threshold is: %d\n", threshold);
