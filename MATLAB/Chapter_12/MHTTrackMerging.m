function kD = MHTTrackMerging( b )

%--------------------------------------------------------------------------
%   Merges tracks.
%
%   Rules: 1 measurement is associated with each track
%          If two tracks only differ by missed measurements they are
%          merged
%
%--------------------------------------------------------------------------
%   Form:
%   b = MHTTrackMerging( b, n )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   b        (m,n)  [scans, tracks]
%
%   -------
%   Outputs
%   -------
%   kD       (1,:)  Tracks to delete
%
%--------------------------------------------------------------------------
%   Reference: A. Amditis1, G. Thomaidis1, P. Maroudis, P. Lytrivis1 and
%              G. Karaseitanidis1, "Multiple Hypothesis Tracking
%              Implementation," www.intechopen.com.
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
    
    disp('Example 1 - each row is a scan');
    
    b = [1 2 2 0 2;...
         1 2 4 1 3;...
         1 2 4 1 2;...
         2 1 1 0 1;...
         2 1 3 2 0;...
         2 1 3 2 1]';
     
    disp(b)
     
	k = MHTTrackMerging( b );
    b(:,k) = [];
    
    disp(b)
    
    disp('Example 2 - each row is a scan');
    
    b = [0 0 0 0 3;...
         0 0 0 0 5;...
         1 2 4 1 0;...
         1 2 4 1 3;...
         1 2 4 1 5]';
     
    disp(b)
     
	k = MHTTrackMerging( b );
    b(:,k) = [];
    
    disp(b)

    clear b;
    return;
end

[n, m] = size(b);
p      = 1;
kD     = [];

% [scan, track]
%--------------
for k = 1:m
    j = find(b(:,k) ~= 0 );
    for i = k+1:m
        if( b(j,k) - b(j,i)  == 0 )
            if( length(j) == n )
                kD = [kD i];
            else
                kD = [kD k];
            end            
        end
    end
end



%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-09-15 14:33:31 -0400 (Thu, 15 Sep 2016) $
% $Revision: 43204 $
