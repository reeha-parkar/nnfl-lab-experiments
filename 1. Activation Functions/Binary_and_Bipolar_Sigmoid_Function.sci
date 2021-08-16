t = [-5:0.1:5];

//Binary Sigmoid Function
function sigmoid = binary(t)
    sigmoid = 1 ./ (1 + exp(-1*t)); // sigmoid = 1/1+e^-x
endfunction

u1 = binary(t);
u2 = binary(2*t);
u3 = binary(3*t);
subplot(2, 1, 1);
plot(t, u1, 'b', 'LineWidth' , 1.5);
plot(t, u2, 'r', 'LineWidth' , 1.5);
plot(t, u3, 'g', 'LineWidth' , 1.5);
xgrid();
title('Binary Sigmoid Function'); 
xlabel('t');
ylabel('sigmoid(t)');

//Bipolar Sigmoid Function
function sigmoid = bipolar(t)
    sigmoid = (exp(t) - exp(-1*t)) ./ (exp(t) + exp(-1*t));
endfunction

subplot(2, 1, 2);
b1 = bipolar(t);
b2 = bipolar(2*t);
b3 = bipolar(3*t);
plot(t, b1, 'b', 'LineWidth' , 1.5);
plot(t, b2, 'r', 'LineWidth' , 1.5);
plot(t, b3, 'g', 'LineWidth' , 1.5);
xgrid();
title('Bipolar Sigmoid Function'); 
xlabel('t');
ylabel('sigmoid(t)');

