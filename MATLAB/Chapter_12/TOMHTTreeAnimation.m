function TOMHTTreeAnimation( action, tracks )

%--------------------------------------------------------------------------
%   Animates a TOMHT tree.
% 
%   Type TOMHTTreeAnimation for a demo. 
%--------------------------------------------------------------------------
%   Form:
%   TOMHTTreeAnimation( action, tracks )
%   TOMHTTreeAnimation( action, tree   )
%   TOMHTTreeAnimation( action, b      )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs    
%   ------
%   action            'initialize' or 'update'
%   tracks    (.)     Track data structure array, OR:
%   tree      {.}     Tree data structure cell array, OR:
%   b         (:,:)   Track tree matrix with IDs in first column
%
%   -------
%   Outputs
%   -------
%   None
%
%--------------------------------------------------------------------------
%   See also MHTTreeDiagram.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%   Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All Rights Reserved.
%--------------------------------------------------------------------------

% Demo
%-----
if( nargin < 1 )
    
  % Initialize
  %-----------
  m =  [  1      1     1     1     1;...
          13     2     2     2     2;...
          41     0     0     1     2;...
          43     0     0     0     1;...
          44     0     0     0     2];
	TOMHTTreeAnimation( 'initialize', m );
  pause(0.5)
    
  m =  [  1      1     1     1     1;...
        13     2     2     2     2;...
        41     0     1     2     2;...
        43     0     0     0     1];
	TOMHTTreeAnimation( 'update', m );
  pause(0.5)
    
  m =  [  1      1     1     1     1;...
        13     2     2     2     2;...
        41     1     2     0     0];
	TOMHTTreeAnimation( 'update', m );
  pause(0.5)
    
  m =  [  1      1     1     1     1;...
          13     2     2     2     2];
	TOMHTTreeAnimation( 'update', m );

  return;
end

switch lower(action)
  case 'initialize'
    MHTTreeDiagram( tracks, [], 0 );
  case 'update'
    MHTTreeDiagram( tracks, [], 1 );
end


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-08-19 23:07:24 -0400 (Fri, 19 Aug 2016) $
% $Revision: 43094 $

