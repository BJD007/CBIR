function [similarImages, similarities] = retrieveImages(queryFeatures, databaseFeatures, imageNames, numResults)
    numImages = length(databaseFeatures);
    similarities = zeros(numImages, 1);
    
    for i = 1:numImages
        similarities(i) = computeSimilarity(queryFeatures, databaseFeatures{i});
    end
    
    [sortedSimilarities, indices] = sort(similarities, 'descend');
    
    similarImages = imageNames(indices(1:numResults));
    similarities = sortedSimilarities(1:numResults);
end% Retrieve Images implementation
