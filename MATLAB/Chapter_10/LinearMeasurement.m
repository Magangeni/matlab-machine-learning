%% LINEARMEASUREMENT Function for an angle measurement
%% Form
%  y = LinearMeasurement( x, d )
%
%% Description
% A linear measurement
%
%% Inputs
%  x       (2,1) State [r;v]
%  d       (.)   Data structure
%
%% Outputs
%  y       (1,1) Distance
%
%% References
% None.

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc.
% All rights reserved.

function y = LinearMeasurement( x, ~ )

if( nargin < 1 )
  y = [];
  return
end

y = x(1);
