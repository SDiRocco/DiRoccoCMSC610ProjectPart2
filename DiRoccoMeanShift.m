%Mean Shift Segmentation of Image
function DiRoccoMeanShift(OutputfilePath,Original,FilesNames,sk,fk,MeanshiftIterations)
    mkdir(OutputfilePath,'MeanShift')
    for i = 1:1:length(Original)
        A = Original{i};
        A = double(A);
        [height,width,depth] = size(A);
        tempA = A;
        APad = padarray(A,[height,width,0],'symmetric');
        weight_map = exp( -(0:255^2)/fk^2 );
        for j = 1:1:MeanshiftIterations
            weightAccum = 0;
            yAccum = 0;
            for k = -sk:sk
                for u = -fk:fk
                    if ( k~=0 || u~=0 )
                        spatialKernel = exp(-(k^2+u^2)/(sk/3)^2/2);
                        x =  APad(height+k:2*height+k-1,width+u:2*width+u-1,1:depth);
                        xDiffSq = (tempA-x).^2;
                        intensityKernel = repmat(prod(reshape(weight_map( xDiffSq+1 ),height,width,depth),3),[1,1, depth]);
                        weightThis = spatialKernel.*intensityKernel;
                        weightAccum = weightAccum+ weightThis;
                        yAccum = yAccum+x.*weightThis;                        
                    end
                end
            end
            y = yAccum./(weightAccum+eps);
            tempA = round(y);
        end
        imwrite(uint8(tempA),OutputfilePath+"MeanShift\"+FilesNames{i},'bmp')
    end
end