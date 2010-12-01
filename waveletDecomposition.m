function features = waveletDecomposition(image)
    % Convert image to grayscale
    grayImage = rgb2gray(image);
    
    % Perform 3-level wavelet decomposition
    [cA, cH, cV, cD] = dwt2(grayImage, 'haar');
    [cA2, cH2, cV2, cD2] = dwt2(cA, 'haar');
    [cA3, cH3, cV3, cD3] = dwt2(cA2, 'haar');
    
    % Compute energy for each sub-band
    energy = @(x) sum(x(:).^2) / numel(x);
    
    features = [
        energy(cH), energy(cV), energy(cD), ...
        energy(cH2), energy(cV2), energy(cD2), ...
        energy(cH3), energy(cV3), energy(cD3), ...
        energy(cA3)
    ];
    
    % Normalize features
    features = features / sum(features);
end