function trk = MHTInitializeTrk( f ) 

%--------------------------------------------------------------------------
%   Initialize the trk data structure.
%--------------------------------------------------------------------------
%   Form:
%   trk = MHTInitializeTrk( f )
%-------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   f	(1,1) Filter data structure
%
%   -------
%   Outputs
%   -------
%   trk	(1,1) Data structure
%
%--------------------------------------------------------------------------
%   SBIR DATA RIGHTS. Contract No. FA9453-11-C-0163, Contractor:
%   Princeton Satellite Systems, 6 Market. St. Suite 926, Plainsboro, 
%   NJ 08536. Expiration of SBIR Data Rights Period: December 27, 2018
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Error message
%--------------
if( nargin < 1 )
    error('One argument is required');
end


trk.filter      = f;
trk.mP          = trk.filter.x;
trk.pP          = trk.filter.p;
trk.m           = trk.filter.x;
trk.p           = trk.filter.p;
trk.meas        = [];
trk.score       = 0;
trk.scoreTotal	= 0;
trk.treeID      = 1;
trk.scanHist    = [];
trk.measHist    = [];
trk.mHist       = [];
trk.d           = [];
trk.new         = [];
trk.gate        = [];
trk.tag         = 0;
trk.scan0       = 0;


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-09-15 14:33:31 -0400 (Thu, 15 Sep 2016) $
% $Revision: 43204 $



