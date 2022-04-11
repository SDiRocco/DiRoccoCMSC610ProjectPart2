%K-means Clustering of Image
function DiRoccoKMeans(OutputfilePath,Original,FilesNames,k,Iterations)
     mkdir(OutputfilePath,'KMeans')
     for p = 1:1:length(Original)
            A = Original{p};
            sizeofA = size(A);
            colofA = reshape(A,[],1);
            colofA = double(colofA);
            Clusteroids = linspace(1,255,k)';
            kColor = uint8(linspace(0,255,k));
            
            for i = 1:1:Iterations
                m = size(colofA,1);
                idx = zeros(size(colofA,1),1);
                distance = zeros(size(colofA,1),1);

                for u = 1:m
                    for j = 1:k
                        distance(j) = sum((colofA(u,:) - Clusteroids(j,:)).*(colofA(u,:) - Clusteroids(j,:)));
                    end
                    [val,index] = min(distance);
                    idx(u) = index;
                    if idx(u) > k
                        idx(u) = k;
                    end
                    distance = 0;
                end
                
                Clusteroids = zeros(k,1);
                averages = zeros(k,1);

                for j = 1:m
                    averages(idx(j),:) = averages(idx(j),:) + colofA(j,:);
                end
                
                a = 0;
                for j = 1:k
                    for l = 1:m
                        if(idx(l) == j)
                            a = a+1;
                        end
                    end
                    arry(j) = a;
                    a = 0;
                end
                Clusteroids = averages./arry';
            end
            
            for i = 1:1:size(colofA,1)
                colofA(i) = kColor(idx(i));
            end
            
            A = uint8(reshape(colofA,sizeofA(1),sizeofA(2)));
            imwrite(A,OutputfilePath+"KMeans\"+FilesNames{p},'bmp')
     end
end