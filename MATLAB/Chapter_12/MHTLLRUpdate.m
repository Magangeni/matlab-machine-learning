function lLR = MHTLLRUpdate( lRK, lRS, lLR )

%--------------------------------------------------------------------------
%   Update the log likelihood ratio.
%   Inputs are the kinematic and signal. Either can be empty.
%--------------------------------------------------------------------------
%   Form:
%   lLR = MHTLLRUpdate( lRK, lRS, lLR )
%-------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   lRK       (1,:) Kinematic likelihood ratios
%   lRS       (1,:) Signal likelihood ratios
%   lLR       (1,1) Log likelihood ratio
%
%   -------
%   Outputs
%   -------
%   lLR       (1,1) Log Likelihood ratio
%
%--------------------------------------------------------------------------
%   Reference: Blackman, S. and R. Popoli, "Design and Analysis of  Modern
%              Tracking Systems," Artech House, 1999, p. 328-330.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% No demo
%--------
if( nargin < 1 )
    disp('Error: One input is required.');
    return;
end

if( nargin < 3 )
    lLR = 0;
end

if( nargin > 1 )
    lLR = lLR + sum(log(lRK) + log(lRS));
else
    lLR = lLR + sum(log(lRK));
end



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-08-22 14:24:57 -0700 (Mon, 22 Aug 2016) $
% $Revision: 43106 $
