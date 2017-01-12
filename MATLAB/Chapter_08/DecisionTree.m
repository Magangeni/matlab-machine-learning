%% DECISIONTREE - implements a decision tree
%% Form
%  [d, r] = DecisionTree( action, d, t )
%
%% Description
% Implements a binary classification tree.
%
%% Inputs
%   action  (1,:) Action 'train', 'test'
%   d       (.)	Data structure
%   t       {:}Inputs for training or testing
%
%% Outputs
%   d       (.)	Data structure
%   r       (:) Results 
%
%% References
%   None

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

function [d, r] = DecisionTree( action, d, t )

if( nargin < 1 )
  d = DefaultDataStructure;
  return
end

switch lower(action)
  case 'train'
    d = Training( d, t );
  case 'test'
    r = Testing( d, t );
  otherwise
    error('%s is not an available action',action);
end

function d = Training( d, t )
%% Training function

function r = Testing( d, t )
%% Testing function

r = 0;

function d = DefaultDataStructure
%% Default data structure

d = struct();


