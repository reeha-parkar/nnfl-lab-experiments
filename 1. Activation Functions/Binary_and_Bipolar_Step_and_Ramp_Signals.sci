clear;
clc;

t = -10:0.01:10;

//Unit Step
u1 = [zeros(1,1000), ones(1,1001)];
subplot(2,2,1);
plot(t,u1, 'LineWidth' , 3);
xgrid();
title('Unit Step Function');
xlabel('t');
ylabel('u1');

//Bipolar
u2 = [-ones(1,1000), ones(1,1001)];
subplot(2,2,2);
plot(t,u2, 'LineWidth' , 3);
xgrid();
title('Unit Step Bipolar Function');
xlabel('t');
ylabel('u2');

//Piecewise linear
x = -2:0.1:2;
function y = pw(x);
if x <=-1/2 then y = 0;
elseif x >= 1/2 then y = 1;
    else y = x + 0.5;
end
endfunction
for ix = 1:length(x)
    y(ix) = pw(x(ix));
end
subplot(2,2,3)
plot(x,y, 'LineWidth' , 3);
xgrid();
title('Piecewise Linear Function')
xlabel('x');
ylabel('y');

//Piecewise linear bipolar
function y = pw(x);
if x <=-1/2 then y = -1;
elseif x >= 1/2 then y = 1;
    else y = 2*x;
end
endfunction
for ix = 1:length(x)
    y(ix) = pw(x(ix));
end
subplot(2,2,4)
plot(x,y, 'LineWidth' , 3);
xgrid();
title('Piecewise Linear Bipolar Function')
xlabel('x');
ylabel('y');
