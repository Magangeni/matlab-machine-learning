%% IMAGEARRAY - Read in an array of images
%
%% Form:
%   s = ImageArray( folderPath )
%
%% Description
% Creates a cell array of images.
%
%% Inputs
%   folderPath   (1,:)	Path to the folder
%
%% Outputs
%   s    {:}	Image array
%
%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

function s = ImageArray( folderPath )

% Demo
if( nargin < 1 )
  folderPath = './Cat224/';
  ImageArray( folderPath );
  return;
end

c = cd;
cd(folderPath)

d = dir;

n = length(d);

j = 0;
s = cell(n-2,1);
for k = 1:n
  name = d(k).name;
  if( ~strcmp(name,'.') && ~strcmp(name,'..') )
    j    = j + 1;
    s{j} = flipud(rgb2gray(imread(d(k).name)));
  end
end

lX    = 3*224;
del   = lX/6;


% Draw the images
NewFigure(folderPath)
colormap(gray);
n = length(s);
x = 0;
y = 0;
for k = 1:n
  image('xdata',[x;x+del],'ydata',[y;y+del],'cdata', s{k} );
  hold on
  x = x + del;
  if ( x == lX );
    x = 0;
    y = y + del;
  end
end
axis off

cd(c)
