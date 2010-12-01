function hist = colorHistogram(image)
    % Convert image to HSV color space
    hsvImage = rgb2hsv(image);
    
    % Compute histogram for each channel
    hHist = imhist(hsvImage(:,:,1), 8);
    sHist = imhist(hsvImage(:,:,2), 8);
    vHist = imhist(hsvImage(:,:,3), 8);
    
    % Normalize histograms
    hist = [hHist; sHist; vHist] / numel(hsvImage);
end