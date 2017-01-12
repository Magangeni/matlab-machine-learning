%% Generate the training data
% Use a for loop to create a set of noisy images for each desired digit (between
% 0 and 9). Save the data along with indices for data to use for training.

%% Copyright
% 2016 Princeton Satellite Systems

digits = 0:5;
nImages = 20;

nDigits = length(digits);
nImages = nDigits*nImages;

input = zeros(256,nImages);
output = zeros(1,nImages);
trainSets = [];
testSets = [];
kImage = 1;
for j = 1:nDigits
  fprintf('Digit %d\n', digits(j));
  for k = 1:nImages
    pixels = CreateDigitImage( digits(j) );
    % scale the pixels to a range 0 to 1
    pixels = double(pixels);
    pixels = pixels/255; 
    input(:,kImage) = pixels(:);
    if j == 1
      output(j,kImage) = 1;
    end
    kImage = kImage + 1;
  end
  sets = randperm(10);
  trainSets = [trainSets (j-1)*nImages+sets(1:5)];
  testSets = [testSets (j-1)*nImages+sets(6:10)];
end

% Use 75% of the images for training and save the rest for testing
trainSets = sort(randperm(nImages,floor(0.75*nImages)));
testSets = setdiff(1:nImages,trainSets);

SaveTS( input, output, trainSets, testSets );
