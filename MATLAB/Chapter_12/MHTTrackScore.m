function [lR, lRK, lRS] = MHTTrackScore( y, varargin )

%--------------------------------------------------------------------------
%   Track score given a scan of data.
%   This is the product of kinematic and signal track scores.
%
%   Assumes a Gaussian distribution for false returns. If you only enter
%   the first 5 arguments for  you will just get the kinematic track score.
%
%   Type MHTTrackScore for a demo with just the kinematic track score.
%
%--------------------------------------------------------------------------
%   Form:
%   [lR, lRK, lRS] =  MHTTrackScore( y, filter, pD, pFA, pH1, pH0 )
%-------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   y       (m,1) Measurement vector (scan)
%   filter	(1,1) Filter data structure
%   pD      (1,1) Probability of detection 
%   pFA     (1,1) Probability of false alarm
%   pH1     (1,1) Probability of a signal if a target is present 
%   pH0     (1,1) Probability of a signal if a target is absent
%
%   -------
%   Outputs
%   -------
%   lR      (1,1) Likelihood ratio
%   lRK     (1,1) Kinematic likelihood ratio
%   lRS     (1,1) Signal likelihood ratio
%
%--------------------------------------------------------------------------
%   Reference: Blackman, S. and R. Popoli, "Design and Analysis of  Modern
%              Tracking Systems," Artech House, 1999.
%--------------------------------------------------------------------------
%   SBIR DATA RIGHTS. Contract No. FA9453-11-C-0163, Contractor:
%   Princeton Satellite Systems, 6 Market. St. Suite 926, Plainsboro, 
%   NJ 08536. Expiration of SBIR Data Rights Period: December 27, 2018
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2012-2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Demo
%-----
if( nargin < 1 )
	h  = [1 0];
    r  = 0.001;
    n  = 100;
    pD = 0.9;
    p  = diag([1 0.1]);
    y  = 0.1;
    pN = zeros(1,n);
    lR = zeros(1,n);
   
    filter.h = h;
	filter.r = r;
	filter.p = p;
    filter.m = [0.04;0];

    for k = 1:n
        pN(k) = norm(p);
        lR(k) = MHTTrackScore( y, filter, pD );
        p     = p*0.8;
    end
    Plot2D( pN, lR, 'Norm(p)', 'LR', 'Track Score', 'ylog' );
    clear lR;
    return
end

% Nonlinear Kalman Filters
%-------------------------
[z, h, r]	= Residual( y, varargin{1} );  
p           = varargin{1}.p;
pD          = varargin{2};
    
if( nargin > 4 )
	pFA = varargin{3};
	pH1 = varargin{4};
	pH0 = varargin{5};
end

% Kinematic track score
%----------------------
lRK = MHTTrackScoreKinematic( z, h, r, p, pD );

% Add the optional signal track score
%------------------------------------
if( nargin > 5 )
	lRS	= MHTTrackScoreSignal( pD, pFA, pH1, pH0 );
	lR	= lRK*lRS;
else
    lR  = lRK;
end


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-09-15 14:33:31 -0400 (Thu, 15 Sep 2016) $
% $Revision: 43204 $


