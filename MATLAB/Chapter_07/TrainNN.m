%% Train a neural net
% Trains the net from the images in the folder. 

%% Copyright
%   Copyright (c) 2016 Princeton Satellite Systems, Inc.
%   All rights reserved.

folderPath = './Cat224';
t   = ImageArray( folderPath );
d   =	ConvolutionalNN;

% This may take awhile
d   =	ConvolutionalNN( 'train', d, t );

% Save the data structure for application in testing
SaveStructure(d,'TrainingData');
