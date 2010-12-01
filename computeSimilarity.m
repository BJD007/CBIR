function similarity = computeSimilarity(features1, features2)
    % Compute cosine similarity
    similarity = dot(features1, features2) / (norm(features1) * norm(features2));
end