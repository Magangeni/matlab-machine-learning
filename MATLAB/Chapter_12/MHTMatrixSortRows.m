function [b2,ks] = MHTMatrixSortRows( b )

%--------------------------------------------------------------------------
%   Sort the matrix rows in ascending order. Move the first non-zero entry
%   of the matrix to be in the first column.
%
%--------------------------------------------------------------------------
%   Form:
%   [b2,ks] = MHTMatrixSortRows( b )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   b       (:,:)  Matrix representation of tracks
%
%   -------
%   Outputs
%   -------
%   b2      (:,:)   Matrix with rows sorted
%   ks      (1,:)   Sort array
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	Copyright (c) 2013 Princeton Satellite Systems, Inc.
%   All rights reserved.
%--------------------------------------------------------------------------

% Number of columns
%------------------
nc = size(b,2);

% No need to sort
%----------------
if( nc == 1 )
    b2 = b;
    ks = 1:length(b);
    return;
end
v = 100.^( nc : -1 : 1 );

% Move the first non-zero element to first column for sorting
%------------------------------------------------------------
b2 = b;
for j=1:size(b,1)
  if( b2(j,1)==0 )
    k = find(b2(j,:)>0,1);
    b2(j,1) = b2( j, k );
    b2(j,k) = 0;
  end
end

[~,ks] = sort( b2 * v' );
b2 = b2(ks,:);


%--------------------------------------
% PSS internal file version information
%--------------------------------------
% $Date: 2016-08-19 23:07:24 -0400 (Fri, 19 Aug 2016) $
% $Revision: 43094 $
