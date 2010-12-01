% Main script for Content-Based Image Retrieval

% Set up paths
addpath('functions');
imagePath = 'path/to/image/database';
queryImagePath = 'path/to/query/image.jpg';

% Load database images and extract features
[databaseFeatures, imageNames] = extractDatabaseFeatures(imagePath);

% Load query image and extract features
queryImage = imread(queryImagePath);
queryFeatures = extractFeatures(queryImage);

% Retrieve similar images
numResults = 10;
[similarImages, similarities] = retrieveImages(queryFeatures, databaseFeatures, imageNames, numResults);

% Display results
figure;
subplot(3, 4, 1);
imshow(queryImage);
title('Query Image');

for i = 1:numResults
    subplot(3, 4, i+1);
    imshow(imread(fullfile(imagePath, similarImages{i})));
    title(sprintf('Similarity: %.2f', similarities(i)));
end