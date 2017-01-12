%% Train a decision tree.
%% Description
% Train a decision tree. 

%% See also
% DecisionTree

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.

% Vertices to define the classes
v = [0 0;0 4; 4 4; 4 0; 0 2; 2 2; 2 0;2 1;4 1;2 1];

% Three polygons define the class regions.
f = {[5 6 7 1] [5 2 3 9 10 6] [7 8 9 4]};

% Generate the test set
t = ClassifierSets( 5, [0 4], [0 4], {'width', 'length'}, v, f );

% Get the default data structure
d = DecisionTree;

% Create the decision tree
d = DecisionTree( 'train', d, t );

% Save as a data structure for use in the testing script
SaveStructure(d,'DecisionTreeData');


