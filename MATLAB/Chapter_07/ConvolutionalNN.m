%% ConvolutionalNN
%% Form:
%   [d, r] = ConvolutionalNN( action, d, t )
%
%% Description
% Implements a convolutional neural net. The net has three types of layers.
% Convolutional, full and pool. The last does not have weights and does
% not need to be trained.
%
%% Inputs
%   action  (1,:) Action 'train', 'test'
%   d       (.)	Data structure
%   t       {:} Images for training or testing
%
%% Outputs
%   d       (.)	Data structure
%   r       (:) Results probability

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

function [d, r] = ConvolutionalNN( action, d, t )

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

[d, r] = NeuralNet( d, t );

function [d, r] = NeuralNet( d, t )
%% Neural Net

q = t;
for k = 1:length(d.layer)
  switch lower(d.layer(k).type)
    case 'pool'
      q = Pool( d.layer(k).data, q );
      
    case 'convolutional'
      q = Convolutional( d.layer(k).data, q );
     
    case 'full'
      q = Full( d.layer(k).data, q );
  end
end

%r = SoftMax( q );

r = 0.56;

function q = Pool( d, q )
%% Neural Net Pool layer


function q = Convolutional( d, q )
%% Neural Net Convolutional layer


function q = Full( d, q )
%% Neural Net Full layer

function d = DefaultDataStructure
%% Default data structure

d = struct();

d.layer(1).type = 'full';
d.layer(1).data = [];
