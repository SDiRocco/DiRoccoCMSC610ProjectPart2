%Copy Input Images to Output
function DiRoccoCopy(OutputfilePath,Original,FilesNames)
    mkdir(OutputfilePath,'Copy')
        for i = 1:1:length(Original)
            imwrite(Original{i},OutputfilePath+"Copy\"+FilesNames{i},'bmp')
        end
end