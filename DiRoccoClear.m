%Clears Output File
function DiRoccoClear(OutputfilePath)
    delete(OutputfilePath)
    status = rmdir(OutputfilePath,'s');
end