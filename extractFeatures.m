function features = extractFeatures(image)
    % Extract color histogram
    colorHist = colorHistogram(image);
    
    % Extract color correlogram
    colorCorr = colorCorrelogram(image);
    
    % Extract wavelet features
    waveletFeatures = waveletDecomposition(image);
    
    % Combine features
    features = [colorHist; colorCorr; waveletFeatures];
end

function [databaseFeatures, imageNames] = extractDatabaseFeatures(imagePath)
    imageFiles = dir(fullfile(imagePath, '*.jpg'));
    numImages = length(imageFiles);
    
    databaseFeatures = cell(numImages, 1);
    imageNames = cell(numImages, 1);
    
    for i = 1:numImages
        img = imread(fullfile(imagePath, imageFiles(i).name));
        databaseFeatures{i} = extractFeatures(img);
        imageNames{i} = imageFiles(i).name;
    end
end% Extract Features implementation
