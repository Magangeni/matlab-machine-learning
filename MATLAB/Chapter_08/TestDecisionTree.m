%% Test a decision tree.
%% Description
% Test a decision tree with 3 classes with irregular, but polygonal
% regions.
%% See also
% DecisionTree

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.

d = load('DecisionTreeData');

% Create data for testing
v = [0 0;0 4; 4 4; 4 0; 0 2; 2 2; 2 0;2 1;4 1;2 1];

% The same regions as the training data
f = {[5 6 7 1] [5 2 3 9 10 6] [7 8 9 4]};

% Generates a new set of points
t = ClassifierSets( 5, [0 4], [0 4], {'width', 'length'}, v, f );

% Test the classification
[d, r] = DecisionTree( 'test', d, t );

