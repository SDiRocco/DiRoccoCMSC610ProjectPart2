%Noise Removal via erosion and dilation
function DiRoccoErodeandDilation(OutputfilePath,Original,FilesNames,DilationStructureElement,ErodeStructureElement,Levels)
    mkdir(OutputfilePath,'ErodeandDilation')
    Filtersize = size(DilationStructureElement);
    for i = 1:1:length(Original)
        A = Original{i}(1+floor(Filtersize(1)/2):size(Original{i},1)-floor(Filtersize(1)/2),1+floor(Filtersize(1)/2):size(Original{i},2)-floor(Filtersize(1)/2));
        
        for j = 1:1:Levels
                for r = 1:1:size(A,1)
                     for c = 1:1:size(A,2)
                         Dilation = double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1)).*DilationStructureElement;
                         A(r,c) = max(Dilation,[],'all');
                     end
                end
        end
        
        ErodeStructureElement(ErodeStructureElement == 0) = 255;
            for j = 1:1:Levels
                for r = 1:1:size(A,1)
                     for c = 1:1:size(A,2)
                         Erode = double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1)).*ErodeStructureElement;
                         A(r,c) = min(Erode,[],'all');
                     end
                end
            end

        imwrite(uint8(A),OutputfilePath+"ErodeandDilation\"+FilesNames{i},'bmp')
    end
end 