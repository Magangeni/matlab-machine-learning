function lR = MHTTrackScoreKinematic( y, h, r, p, pD )

%--------------------------------------------------------------------------
%   Kinematic track score.
%
%   This is the likelihood ratio for the kinematics
%
%   Assumes a Gaussian distribution for false returns.
%
%   Type TrackScoreKinematic for a demo with a decreasing covariance
%   matrix for a 1D problem and a fixed residual error.
%--------------------------------------------------------------------------
%   Form:
%   lR = MHTTrackScoreKinematic( y, h, r, p, v )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   y         (m,1) Measurement residual vector
%   h         (m,n) Measurement matrix
%   r         (m,m) Measurement covariance matrix
%   p         (n,n) Covariance matrix
%   pD        (1,1) Probability of detection on 1 scan
%
%   -------
%   Outputs
%   -------
%   lR        (1,1) Likelihood ratio
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
   h    = [1 0];
   r    = 0.001;
   n    = 100;
   pD	= 0.9;
   p    = diag([1 0.1]);
   y    = 0.1;
   pN   = zeros(1,n);
   lR   = zeros(1,n);
   
   for k = 1:n
        pN(k) = norm(p);
        lR(k) = MHTTrackScoreKinematic( y, h, r, p, pD );
        p     = p*0.8;
   end
   Plot2D(pN,lR,'Norm(p)', 'LR', 'Kinematic Track Score','ylog');
   clear lR;
   return
end

% The first branch is when there are no measurements
%---------------------------------------------------
if( isempty(y) )
    lR = 1 - pD;
else

    % Length of the measurement vector
    %---------------------------------
    M  = length(y);

    % Measurement residual covariance matrix
    %---------------------------------------
    s  = h*p*h' + r;

    % Normalized statistical distance
    %--------------------------------
    d2 = y'*(s\y);

    % The likelihood ratio
    %---------------------
    lR = pD*exp(-0.5*d2)/((2*pi)^(0.5*M)*sqrt(det(s)));
end


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-09-15 14:33:31 -0400 (Thu, 15 Sep 2016) $
% $Revision: 43204 $

