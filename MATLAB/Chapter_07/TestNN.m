%% Test a neural net
%% Description
% Uses the trained convolutional neural net to determine if the image
% is a cat.

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

name  = 'RoboPanda.png';
t     = rgb2gray(imread(name));

NewFigure('Test Image');
colormap(gray);
image(t);
axis off

d       = load('TrainingData');
[d, r]  = ConvolutionalNN( 'test', d, t );


fprintf(1,'Image %s has a %4.1f%% chance of being a cat\n',name,100*r);