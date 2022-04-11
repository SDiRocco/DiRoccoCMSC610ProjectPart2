% Edge Detection Using the Magnitude of the Single Derivative Gradient
function DiRocco1stEdge(OutputfilePath,Original,FilesNames,EdgeThreshold)
    mkdir(OutputfilePath,'FirstEdge')
    DerivativeFilt = 0.5*[0 -1 0;-1 0 1;0 1 0];
    Filtersize = size(DerivativeFilt);
    for i = 1:1:length(Original)
            A = Original{i}(1+floor(Filtersize(1)/2):size(Original{i},1)-floor(Filtersize(1)/2),1+floor(Filtersize(1)/2):size(Original{i},2)-floor(Filtersize(1)/2));
            for r = 1:1:size(A,1)
                 for c = 1:1:size(A,2)
                     Gradient = double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1)).*DerivativeFilt;
                     magGradient = sqrt((sum(Gradient(2,:))^2+(sum(Gradient(:,2)))^2));
                     if magGradient > EdgeThreshold
                         A(r,c) = 255;
                     else
                         A(r,c) = 0;
                     end
                 end
            end
            imwrite(A,OutputfilePath+"FirstEdge\"+FilesNames{i},'bmp')
    end
end