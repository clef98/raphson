%%Name findClosestCentroids.m
function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);    %centroids = 3x2 
idx = zeros(size(X,1), 1); 

for i=1:size(X,1);
  temp = zeros(K,1);  
  for j=1:K;
    
    temp(j) = sqrt(sum((X(i,:) - centroids(j,:)) .^ 2));
    
  endfor
  
  [~,idx(i)] = min(temp);
endfor

end
