
%% Draw a box centered at the origin.
%
% Type Box for a demo.
%% Form:
%   [v, f] = Box( x, y, z, openFace )
%
%% Inputs
%   x           (1,1)  x length
%   y           (1,1)  y length
%   z           (1,1)  z length
%   
%% Outputs
%   v           ( 8,3) Vertices
%   f           (12,3) Faces
%

%% Copyright
%   Copyright (c) 2001-2002 Princeton Satellite Systems, Inc.
%   All rights reserved.

function [v, f] = Box( x, y, z )

% Demo
if( nargin < 1 )
  Demo
  return
end

% Faces
f   = [2 3 6;3 7 6;3 4 8;3 8 7;4 5 8;4 1 5;2 6 5;2 5 1;1 3 2;1 4 3;5 6 7;5 7 8];

% Vertices
v = [-x  x  x -x -x  x  x -x;...
     -y -y  y  y -y -y  y  y;...
     -z -z -z -z  z  z  z  z]'/2;

% Default outputs
if( nargout == 0 )
	DrawVertices( v, f, 'Box' );
  clear v
end

function Demo
x = 1;
y = 2;
z = 3;
Box( x, y, z );
