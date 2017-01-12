%% UKFSim
% Demonstrate an Unscented Kalman Filter. 
%% See also
% RungeKutta, RHSOscillator, TimeLabel, KFInitialize, UKFUpdate, UKFPredict
% AngleMeasurement

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.

%% Initialize
nSim            = 5000;             % Simulation steps
dT              = 0.1;              % Time step (sec)
d               = RHSOscillator;    % Get the default data structure
d.a             = 0.1;              % Disturbance acceleration
d.zeta          = 0.1;              % Damping ratio
x               = [0;0];            % Initial state [position;velocity]
y1Sigma         = 0.01;             % 1 sigma measurement noise
dMeas.baseline  = 10;               % Distance of sensor from start
xE              = [0;0];            % Estimated initial state
q               = diag([0.01 0.001]);
p               = diag([0.001 0.0001]);
dKF             = KFInitialize( 'ukf','m',xE,'f',@RHSOscillator,'fData',d,...
                                'r',y1Sigma^2,'q',q,'p',p,...
                                'hFun',@AngleMeasurement,'hData',dMeas,'dT',dT);
dKF             = UKFWeight( dKF );

%% Simulation
xPlot = zeros(5,nSim);

for k = 1:nSim
  
  % Measurements
  y           = AngleMeasurement( x, dMeas ) + y1Sigma*randn;
  
  % Update the Kalman Filter
  dKF.y       = y;
  dKF         = UKFUpdate(dKF);
  
  % Plot storage
  xPlot(:,k)  = [x;y;dKF.m-x];
  
  % Propagate (numerically integrate) the state equations
  x           = RungeKutta( @RHSOscillator, 0, x, dT, d ); 
  
  % Propagate the Kalman Filter
	dKF         = UKFPredict(dKF);
 
end

%% Plot the results
yL     = {'r (m)' 'v (m/s)'  'y (rad)' '\Delta r_E (m)' '\Delta v_E (m/s)' };
[t,tL] = TimeLabel(dT*(0:(nSim-1)));

PlotSet( t, xPlot, 'x label', tL, 'y label', yL,...
  'plot title', 'UKF Simulation', 'figure title', 'UKF Simulation' );
