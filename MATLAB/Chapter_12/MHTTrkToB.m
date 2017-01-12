function [bMeas, bSens, bScan] = MHTTrkToB( trk )

%--------------------------------------------------------------------------
%   Converts a "trk" data structure to a "b" matrix.
%
%   The bMeas or "b" matrix represents a stacked set of track-trees.
%     Each row is a different path through a track-tree
%     Each column is a different scan/sensor combination.
%     Each value in the matrix is a measurement index for that scan. 
%
%   The first column of the "b" matrix has the object ID for each track.
%   Several tracks may have the same object ID. In this case, they 
%   represent alternative sets of measurements that may be attributed to
%   the object.
% 
%   Each of the remaining columns represents a different scan and sensor.
%   If there are multiple sensors, the matrix is organized by sensor. 
%   The first set of columns are for the first sensor, the second set for
%   the second sensor, and so on. An example is provided below for clarity.
%   In this example, we have two scans, two sensors, and object IDs 5,6,7.
%   Each object has two different tracks.
% 
%   ObjID   Sens1/Scan1   Sens1/Scan2   Sens2/Scan1   Sens2/Scan2
%     5          1             1             2             1
%     5          2             0             1             0
%     6          1             3             3             1
%     6          1             0             1             2
%     7          1             3             1             1
%     7          1             0             2             3
%
%   The scans for sensor 1 are listed in the first two columns. The scans
%   for the next sensor are listed in the next two columns. Note that each
%   sensor could have a different number of scans.
%
%   The numbers 0,1,2,3 appear in the matrix. Each of these numbers is a
%   measurement index. Measurements taken during each scan are indexed
%   starting at 1. A value of 0 means the track has no measurement from 
%   that sensor for that scan.
%
%   Type MHTTrkToB for a demo. Will draw the tree if there are no outputs.
%--------------------------------------------------------------------------
%   Form:
%   [bMeas,bSens,bScan] = MHTTrkToB( trk )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs    
%   ------
%   trk       (:)    Track data structure array
%
%   -------
%   Outputs
%   -------
%   bMeas    (:,:)   Measurement ID Matrix 
%   bSens    (:,:)   Sensor ID Matrix 
%   bScan    (:,:)   Scan ID Matrix 
%   
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%   Copyright (c) 2013. Princeton Satellite Systems, Inc.
%   All Rights Reserved.
%--------------------------------------------------------------------------

% Demo
%-----
if( nargin < 1 )
    
  
  k=1;
  trk(k).measHist = [1 1 0 0]; k=k+1;
  trk(k).measHist = [1 1 1 1]; k=k+1;
  trk(k).measHist = [1 1 1 2]; k=k+1;
  trk(k).measHist = [1 2 0 1]; k=k+1;
  trk(k).measHist = [1 2 0 2]; k=k+1;
  trk(k).measHist = [1 2 1 1]; k=k+1;
  trk(k).measHist = [2 1 0 0]; k=k+1;
  trk(k).measHist = [2 1 0 1]; k=k+1;
  trk(k).measHist = [2 1 1 1]; k=k+1;
  trk(k).measHist = [2 1 1 2]; k=k+1;
  trk(k).measHist = [2 2 1 1]; k=k+1;
  trk(k).measHist = [2 2 1 2]; k=k+1;
  
  for i=1:k-1
    trk(i).scanHist = [5 6 7 8];
    trk(i).sensorHist = [1 1 1 1];
    trk(i).sensorHist( trk(i).measHist==0 ) = 0;
  end
  trk(k).measHist   = [2   2 1];
  trk(k).scanHist   = [5   7 8];
  trk(k).sensorHist = [1   1 1];
  k=k+1;
  trk(k).measHist   = [  1 1 1];
  trk(k).scanHist   = [  6 7 8];
  trk(k).sensorHist = [  1 1 1];
  k=k+1;
  trk(k).measHist   = [  1 1 2];
  trk(k).scanHist   = [  6 7 8];
  trk(k).sensorHist = [  1 1 1];
  
  for k=1:length(trk)
    trk(k).treeID = ceil(k/3);
  end
  
  for k=1:length(trk)
    trk(k).measHist   = [trk(k).measHist,   trk(k).measHist];
    trk(k).scanHist   = [trk(k).scanHist,   trk(k).scanHist];
    trk(k).sensorHist = [trk(k).sensorHist, trk(k).sensorHist+1];
  end
  
  % A track data structure
  %-----------------------
  [b,c,d] = MHTTrkToB( trk );  
  disp(b)
  disp(c)
  disp(d)
  
  % Display the tree
  %-----------------
  n = MHTMatrixTreeConvert( b );
  TreeDiagram( n );
  clear b;
  return;
end

% Handle empty tracks
%--------------------
if( isempty(trk) )
    bMeas = [];
    bSens = [];
    bScan = [];
    return;
end

nT  = length(trk);

% Get the scanID list
%--------------------
%scanID  = unique([trk.scanHist]);
scanID    = unique([trk.scanHist]);
sensorID  = unique([trk.sensorHist]);

nScan = length(scanID);
nSensor = length(sensorID);

% maximum number of columns = nScan x nSensor
nCol = nScan * nSensor;   % trim un-used columns after matrix is filled

bMeas = zeros(nT,nCol);
bSens = zeros(nT,nCol);
bScan = zeros(1,nCol);

% group columns first by sensor
for k = 1:nSensor
  thisSensor = sensorID(k);
  
  col0 = (k-1)*nScan;
  
  % for each track (row)
  for i=1:nT
    row = i;
    
    % if this track has a scan history
    if( ~isempty(trk(i).scanHist) )
      
      % find all scans/measurements in this track with sensorID = thisSensor
      kSens = find( trk(i).sensorHist == thisSensor );
      
      for j=1:length(kSens)
        
        thisScan = trk(i).scanHist(kSens(j));
        thisMeas = trk(i).measHist(kSens(j));
        
        kcol = find( scanID == thisScan );
        col  = col0 + kcol;
              
        bMeas(row,col) = thisMeas;
        bSens(row,col) = thisSensor;
        bScan(1,col) = thisScan;
        
      end
    
    end
    
  end
  
end

% remove any columns with all zeros
s = sum(bMeas,1);
kNonZero = find(s>0);
bMeas = bMeas(:,kNonZero);
bSens = bSens(:,kNonZero);
bScan = bScan(:,kNonZero);

% prepend track-tree IDs
bMeas = [ [trk.treeID]', bMeas ];
bSens = [ [trk.treeID]', bSens ];

% If there are no outputs draw the tree
%--------------------------------------
if( nargout < 1 )
  n = MHTMatrixTreeConvert( bMeas );
  MHTTreeDiagram( trk );
  clear bMeas;
end



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-08-19 23:07:24 -0400 (Fri, 19 Aug 2016) $
% $Revision: 43094 $
