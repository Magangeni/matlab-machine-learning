%% SQUAREWAVE
%
%% Description
% Generates a square wave with a magnitude either 0 or 1.
%
%% Form
%  [v, d] = SquareWave( t, d )
%
%% Inputs
%  t      (1,1) Time (sec)
%  d      (.)   Data structure
%                .tLow    (1,1) Low time
%                .tHigh   (1,1) Time high
%                .tSwitch (1,1) Last switch time
%                .state   (1,1) 0 = low, 1 = high
%
%% Outputs
%  d      (.)   Data structure
%
%% References
% None.

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc.
% All rights reserved.

function [v,d] = SquareWave( t, d )

if( nargin < 1 )
  if( nargout == 0 )
    Demo;
  else
    v = DataStructure;
  end
	return
end

if( d.state == 0 )
  if( t - d.tSwitch >= d.tLow )
    v         = 1;
    d.tSwitch = t;
    d.state   = 1;
  else
    v         = 0;
  end
else
  if( t - d.tSwitch >= d.tHigh )
    v         = 0;
    d.tSwitch = t;
    d.state   = 0;
  else
    v         = 1;
  end
end

function d = DataStructure
%% Default data structure

d           = struct();
d.tLow      = 10.0;
d.tHigh     = 10.0;
d.tSwitch   = 0;
d.state     = 0;

function Demo
%% Demo

d = SquareWave;
t = linspace(0,100,1000);
v = zeros(1,length(t));
for k = 1:length(t)
  [v(k),d] = SquareWave(t(k),d);
end

PlotSet(t,v,'x label', 't (sec)', 'y label', 'v', 'plot title','Square Wave',...
        'figure title', 'Square Wave');
  


