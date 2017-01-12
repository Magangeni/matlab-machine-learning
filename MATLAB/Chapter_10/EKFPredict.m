function d = EKFPredict( d )

%--------------------------------------------------------------------------
%   Extended Kalman Filter prediction step.
%
%   Since Version 11.
%--------------------------------------------------------------------------
%   Form:
%   d = EKFPredict( d )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   d	(1,1)  EKF data structure
%              .m       (n,1)       Mean
%              .p       (n,n)       Covariance
%              .q       (n,n)       State noise
%              .f       (1,:)       Name of right hand side
%              .fX      (1,:)       Jacobian of right hand side
%              .fData	(1,1)       Data structure with data for f
%              .dT      (1,1)       Time step
%              .t       (1,1)       Time
%
%   -------
%   Outputs
%   -------
%   d	(1,1)  EKF data structure
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2012 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Get the state transition matrix
%--------------------------------
a   = feval(d.fX, d.m, d.t, d.fData );

% Propagate the mean
%-------------------
d.m = RK4( d.f, d.m, d.dT, d.t, d.fData );

% Propagate the covariance
%-------------------------
d.p = a*d.p*a' + d.q;

% PSS internal file version information
%--------------------------------------
% $Date: 2016-06-27 15:56:14 -0400 (Mon, 27 Jun 2016) $
% $Revision: 42728 $
