//truth table
//x1 x2  b  t
//1  1   1  1
//1  -1  1  1
//-1  1  1  1
//-1 -1  1 -1

clc ;
clear ;
disp("Reeha Parkar - 60001180046");
disp ('Adaline network for OR function Bipolar inputs and targets') ;

// inputs
x1 =[1 1 -1 -1];
x2 =[1 -1 1 -1];

// bias
x3 =[1 1 1 1];

// target
t =[1 1 1 -1];

// weights and bias
w1 =0.1; 
w2 =0.1; 
b =0.1;

//learning rate
alpha =0.1;

// error:
e =0;
e1=0;

delw1 =0; delw2 =0; delb =0;
epoch =1;

//1st epoch
for i =1:4
    nety(i) = w1*x1(i) + w2*x2(i) + b ;
    
    nt =[ nety(i) t(i)];
    delw1 = alpha*(t(i)-nety(i)) * x1(i) ;
    delw2 = alpha*(t(i)-nety(i)) * x2(i) ;
    delb = alpha*(t(i)-nety(i)) * x3(i) ;
    // weight changes
    wc =[ delw1 delw2 delb ]
    // update weights
    w1 = w1 + delw1 ;
    w2 = w2 + delw2 ;
    b = b + delb ;
    //new weights
    w =[ w1 w2 b ];
    // input current
    x =[ x1(i) x2(i) x3(i) ];

end

for i =1:4
e = e + (t(i)-nety(i))^2;
end;

//Error prints:
disp("Error after first epoch:");
disp(e);


//2nd epoch
for i =1:4
    nety(i) = w1*x1(i) + w2*x2(i) + b ;
    
    nt =[ nety(i) t(i) ];
    delw1 = alpha*(t(i)-nety(i)) * x1(i) ;
    delw2 = alpha*(t(i)-nety(i)) * x2(i) ;
    delb = alpha*(t(i)-nety(i)) * x3(i) ;
    // weight changes
    wc =[ delw1 delw2 delb ]
    // updating of weights
    w1 = w1 + delw1 ;
    w2 = w2 + delw2 ;
    b = b + delb ;
    //new weights
    w =[ w1 w2 b ];
    // input pattern
    x =[ x1(i) x2(i) x3(i) ];

end


for i =1:4
    e1 = e1 + (t(i)-nety(i))^2;
end;

//Error prints:
disp("Error after second epoch:");
disp(e1);

disp("Error difference error2-error1");
disp(e-e1);

epoch = epoch + 1;



while(e - e1) > 0.1 
    epoch = epoch +1;
    e = e1;
    e1 = 0;
    for i =1:4
        nety(i) = w1*x1(i) + w2*x2(i) + b ;
        
        nt =[nety(i) t(i)];
        delw1 = alpha*(t(i)-nety(i)) * x1(i);
        delw2 = alpha*(t(i)-nety(i)) * x2(i);
        delb = alpha*(t(i)-nety(i)) * x3(i);
        // weight changes
        wc =[ delw1 delw2 delb ]
        // update weights
        w1 = w1 + delw1 ;
        w2 = w2 + delw2 ;
        b = b + delb ;
        //weights
        w =[ w1 w2 b ];
        // input 
        x =[ x1(i) x2(i) x3(i) ];
    end

    //printing the error difference
    for i =1:4
        e1 = e1 + (t(i)-nety(i))^2;
    end
    
    disp("Current epoch:");
    disp(epoch);   
    disp("Current epoch error") ;
    disp(e1);
    disp("Error difference");
    disp(e-e1);
end

disp("Total Number of epochs ");
disp(epoch);
disp("The final bias is: ");
disp(b);
disp("The final weights are: ");
disp("w1 =");
disp(w1);
disp("w2 =");
disp(w2);

