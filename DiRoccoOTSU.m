%OTSU Histogram Thresholding of Image
function DiRoccoOTSU(OutputfilePath,Original,FilesNames)
    mkdir(OutputfilePath,'OTSU')
    for i = 1:1:length(Original)
            A = Original{i};
            
            num_bins = 256;
            counts = imhist(A,num_bins);
            num_bins = numel(counts);
            counts = double(counts(:));
            
            p = counts / sum(counts);
            omega = cumsum(p);
            mu = cumsum(p .* (1:num_bins)');
            mu_t = mu(end);
            sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));
            
            maxval = max(sigma_b_squared);
            isfinite_maxval = isfinite(maxval);
            if isfinite_maxval
                idx = mean(find(sigma_b_squared == maxval));
                tval = (idx - 1) / (num_bins - 1);
            else
                tval = 0.0;
            end
            
            A(A >= tval*255) = uint8(255);
            A(A < tval*255) = uint8(0);

            imwrite(A,OutputfilePath+"OTSU\"+FilesNames{i},'bmp')
    end
end