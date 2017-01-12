%% Represent 2D data
% Demonstrate 2D data display
%% See also
% surf, surfl, mesh, bar3, contour 

%% Copyright
% Copyright (c) 2016 Princeton Satellite Systems, Inc. 
% All rights reserved.

m = rand(8,8);

NewFigure('Two Dimensional Data');

subplot(2,3,1)
surf(m)
title('surf')

subplot(2,3,2)
surfl(m,'light')
title('surfl')

subplot(2,3,3)
mesh(m)
title('mesh')

subplot(2,3,4)
bar3(m)
title('bar3')

subplot(2,3,5)
h = bar3(m);
title('bar3')

colorbar
for k = 1:length(h)
	zdata = h(k).ZData;
	h(k).CData = zdata;
	h(k).FaceColor = 'interp';
end

subplot(2,3,6)
contour(m);
title('contour')
