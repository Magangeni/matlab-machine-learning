%% SOFTMAX
%% Form:
%   [p, pMax, kMax] = Softmax( q )
%
%% Description
% Finds the maximum value using the logistic function.
%
%% Inputs
%   q    (1,:)	Input array
%
%% Outputs
%   p    (1,:)	Output array
%   pMax (1,1)  Maximum value
%   kMax (1,1)  Index of the maximum value
%

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

function [p, pMax, kMax] = Softmax( q )

% Demo
if( nargin == 0 )
  q = [1,2,3,4,1,2,3];
  [p, pMax, kMax] = Softmax( q )
  sum(p)
  clear p
  return
end

n = length(q);
p = zeros(1,n);

den = sum(exp(q));

for k = 1:n
  p(k) = exp(q(k))/den;
end

[pMax,kMax] = max(p);

