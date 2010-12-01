function correlogram = colorCorrelogram(image)
    % Convert image to indexed image with 64 colors
    [indexedImage, colorMap] = rgb2ind(image, 64);
    
    % Define distance set
    distances = [1, 3, 5, 7];
    
    % Compute correlogram
    correlogram = zeros(64, length(distances));
    
    for i = 1:64
        for d = 1:length(distances)
            mask = (indexedImage == i-1);
            dilatedMask = imdilate(mask, strel('diamond', distances(d))) - mask;
            correlogram(i, d) = sum(indexedImage(dilatedMask) == i-1) / sum(dilatedMask(:));
        end
    end
    
    % Flatten and normalize correlogram
    correlogram = correlogram(:) / sum(correlogram(:));
end