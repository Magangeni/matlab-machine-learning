
%% WRAPPHASE
%   Wrap a phase angle (or vector of angles) to keep it between -pi and +pi
%% Form:
%   angle = WrapPhase( angle )
%
%% Inputs
%   angle            (1,:)    Phase angle [rad]
%
%% Outputs
%   angle            (1,:)    Wrapped phase angle between -pi and +pi [rad]
%

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

function angle = WrapPhase( angle )

kp = find(angle>pi);
kn = find(angle<-pi);

angle(kp) = angle(kp) - ceil((angle(kp)-pi)/(2*pi))*2*pi;
angle(kn) = angle(kn) + abs(floor((angle(kn)+pi)/(2*pi)))*2*pi;
