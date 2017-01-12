function lR = MHTInitialTrackScore( betaNT, vC, pD, pFA, pH1, pH0 )

%--------------------------------------------------------------------------
%   Initialize the track likelihood ratio.
%
%   Type MHTInitialTrackScore for a demo showing the effect of pD.
%
%--------------------------------------------------------------------------
%   Form:
%   lR = MHTInitialTrackScore( betaNT, vC, pD, pFA, pH1, pH0 )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   betaNT	(1,1) New target density 
%   vC      (1,1) Control volume
%   pD      (1,1) Probability of detection 
%   pFA     (1,1) Probability of false alarm
%   pH1     (1,1) Probability of a signal if a target is present 
%   pH0     (1,1) Probability of a signal if a target is absent
%
%   -------
%   Outputs
%   -------
%   lR      (1,1) Initial Likelihood ratio
%
%--------------------------------------------------------------------------
%   Reference: Blackman, S. and R. Popoli, "Design and Analysis of  Modern
%              Tracking Systems," Artech House, 1999, p. 331.
%--------------------------------------------------------------------------
%   SBIR DATA RIGHTS. Contract No. FA9453-11-C-0163, Contractor:
%   Princeton Satellite Systems, 6 Market. St. Suite 926, Plainsboro, 
%   NJ 08536. Expiration of SBIR Data Rights Period: December 27, 2018
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Demo
%-----
if( nargin < 1 )
   pD       = linspace(0.1,1);
   pFA      = 0.01;
   pH1      = 0.9;
   pH0      = 0.1;
   vC       = 10;
   betaNT	= 1;
   llR = log(MHTInitialTrackScore( betaNT, vC, pD, pFA, pH1, pH0 ));
   Plot2D(pD,llR,'Probability of Detection','Log Likelihood','Initial Track Core');
   return
end

lR = betaNT.*vC.*MHTTrackScoreSignal( pD, pFA, pH1, pH0 );


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-09-15 14:33:31 -0400 (Thu, 15 Sep 2016) $
% $Revision: 43204 $
