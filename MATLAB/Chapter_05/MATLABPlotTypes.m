%% Demonstrate MATLAB plot types

% Demonstrate 2D plot types
%% See also
% PlotSet

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.


NewFigure('Plot Types')
x = linspace(0,10,10);
y = rand(1,10);

subplot(4,1,1);
plot(x,y);
subplot(4,1,2);
bar(x,y);
subplot(4,1,3);
barh(x,y);
subplot(4,1,4);
pie(y)