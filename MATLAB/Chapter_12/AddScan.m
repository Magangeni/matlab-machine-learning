function scan = AddScan( data, sensorType, sensorID, param, scan )

%--------------------------------------------------------------------------
%   Add a scan to the scan data structure array.
%--------------------------------------------------------------------------
%   Form:
%   scan = AddScan( data, sensorType, sensorID, param, scan )
%-------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   data         (.)    Data
%   sensorType	(1,1)   Integer for the data type
%   sensorID    (1,1)   Integer for sensor ID
%   param        (.)    Parameter data structure
%                       .hFun   (1,:) Pointer to measurement function
%                       .hData   (.)  Data structure for the measurement
%                                     function
%   scan         (:)    Scan data structure
%
%   -------
%   Outputs
%   -------
%   scan         (:)    Data structure array with new scan appended
%                       .data       (.)   Data
%                       .sensorType (1,1) Integer for data type
%                       .sensorID   (1,1) Integer for sensor ID
%                       .param      (1,1) Parameter data structure
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Input processing
%-----------------
if( nargin < 2 )
    sensorType = [];
end

if( nargin < 3 )
    sensorID = [];
end

if( nargin < 4 )
    param = [];
end

if( isempty(sensorType) )
    sensorType = 1;
end

if( isempty(sensorID) )
    sensorID = 1;
end

% Create the data structure
%--------------------------
s = struct( 'data', data, 'sensorType', sensorType, 'sensorID', sensorID, 'param', param );

% Append if necessary
%--------------------
if( nargin < 5 || isempty(scan) )
  scan        = s;
else
  scan(end+1)	= s;
end



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-08-19 23:07:24 -0400 (Fri, 19 Aug 2016) $
% $Revision: 43094 $

