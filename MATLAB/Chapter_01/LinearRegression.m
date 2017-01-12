%% LinearRegression Script that demonstrates linear regression
%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.

% Input
x = linspace(0,1,1000)';
n = length(x);

% Model a line, y = mx + b
m     = 1.0;     % slope
b     = 1.0;     % intercept
sigma = 0.1; % standard deviation of the noise
y     = x + sigma*randn(n,1);

% Perform the linear regression using pinv
a     = [x ones(n,1)];
c     = pinv(a)*y;
yR    = c(1)*x + c(2); % the fitted line

% Plot
h = figure;
h.Name = 'Linear Regression';
title('Linear Regression');
plot(x,y); hold on;
plot(x,yR,'linewidth',2);
grid
xlabel('x');
ylabel('y');
legend('Data','Fit')