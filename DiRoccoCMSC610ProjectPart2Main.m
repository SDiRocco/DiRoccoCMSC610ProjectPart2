% DiRocco CMSC610 Project Part 1 Main
% Shawn DiRocco

% Run Main using SetUp file as string as input
% SetUp file must be in same path
function DiRoccoCMSC610ProjectPart2Main(SetupFile)
    StartTime = tic;
    %Runs Setup File to retrieve variables
    run(SetupFile)
    
    %Reads and Saves Original Images
    imds = imageDatastore(InputfilePath);
    Original = readall(imds);
    
    %Normalizing grayscale values to be equal to 1
    if (cR+cG+cB) ~= 1.0
        ctemp = [cR cG cB];
        cR = ctemp(1)/(ctemp(1)+ctemp(2)+ctemp(3));
        cG = ctemp(2)/(ctemp(1)+ctemp(2)+ctemp(3));
        cB = ctemp(3)/(ctemp(1)+ctemp(2)+ctemp(3));
    end

    %Convert from RGB to Grayscale
    for i = 1:1:length(Original)
        A = Original{i};
        if size(A,3) == 3
            A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
        end
        Original{i} = A;
    end

    %Save File Names
    Files = imds.Files;
    Files = convertCharsToStrings(Files);
    match = wildcardPattern + "\";
    FilesNames = erase(Files,match);
    
    %Checking to See if amount of images matches amount inputed as Classes
    if length(Original) ~= (cyl+inter+let+modc+para+super+svar)
        error('Unequal Amount of Images in Input Folder Compared to Amount per Class')
    end

    Classes = [cyl,inter,let,modc,para,super,svar];
    Classstr = strsplit('cyl inter let mod para super svar');
    
    disp("Setup Excution Time(s) =")
    display(toc(StartTime))

    disp("Setup Excution Time per Image(s) =")
    display(toc(StartTime)./size(Original,1))
    
    ClearTime = tic;
    % Clear Output Folder
    if strcmpi('yes',Clear)
        DiRoccoClear(OutputfilePath)
    end
    
    disp("Clear Excution Time(s) =")
    display(toc(ClearTime))

    disp("Clear Excution Time per Image(s) =")
    display(toc(ClearTime)./size(Original,1))
    
    CopyTime = tic;
    % Copy Input to Output
    if strcmpi('yes',Copy)
        DiRoccoCopy(OutputfilePath,Original,FilesNames)
    end
    
    disp("Copy Excution Time(s) =")
    display(toc(CopyTime))

    disp("Copy Excution Time per Image(s) =")
    display(toc(CopyTime)./size(Original,1))
    
    FirstEdgeTime = tic;
    if strcmpi('yes',FirstEdge)
        DiRocco1stEdge(OutputfilePath,Original,FilesNames,EdgeThreshold)
    end
    
    disp("FirstEdge Excution Time(s) =")
    display(toc(FirstEdgeTime))

    disp("FirstEdge Excution Time per Image(s) =")
    display(toc(FirstEdgeTime)./size(Original,1))
    
    
    DilationTime = tic;
    if strcmpi('yes',Dilation)
        DiRoccoDilation(OutputfilePath,Original,FilesNames,DSE,DilationLevels)
    end
    
    disp("Dilation Excution Time(s) =")
    display(toc(DilationTime))

    disp("Dilation Excution Time per Image(s) =")
    display(toc(DilationTime)./size(Original,1))
    
    ErodeTime = tic;
    if strcmpi('yes',Erode)
        DiRoccoErode(OutputfilePath,Original,FilesNames,ESE,ErosionLevels)
    end
    
    disp("Erode Excution Time(s) =")
    display(toc(ErodeTime))

    disp("Erode Excution Time per Image(s) =")
    display(toc(ErodeTime)./size(Original,1))
    
    ErodeandDilationTime = tic;
    if strcmpi('yes',ErodeandDilation)
        DiRoccoErodeandDilation(OutputfilePath,Original,FilesNames,DSE,ESE,NoiseLevel)
    end
    
    disp("ErodeandDilation Noise Removal Excution Time(s) =")
    display(toc(ErodeandDilationTime))

    disp("ErodeandDilation Noise Removal Time per Image(s) =")
    display(toc(ErodeandDilationTime)./size(Original,1))

    OTSUTime = tic;
    if strcmpi('yes',OTSU)
        DiRoccoOTSU(OutputfilePath,Original,FilesNames)
    end
    
    disp("OTSU Excution Time(s) =")
    display(toc(OTSUTime))

    disp("OTSU Excution Time per Image(s) =")
    display(toc(OTSUTime)./size(Original,1))

    KMeansTime = tic;
    if strcmpi('yes',KMeans)
        DiRoccoKMeans(OutputfilePath,Original,FilesNames,k,Iterations)
    end
    
    disp("KMeans Excution Time(s) =")
    display(toc(KMeansTime))

    disp("KMeans Excution Time per Image(s) =")
    display(toc(KMeansTime)./size(Original,1))
    
    MeanshiftTime = tic;
    if strcmpi('yes',Meanshift)
        DiRoccoMeanShift(OutputfilePath,Original,FilesNames,sk,fk,MeanshiftIterations)
    end
    
    disp("Mean Shift Excution Time(s) =")
    display(toc(MeanshiftTime))

    disp("Mean Shift Excution Time per Image(s) =")
    display(toc(MeanshiftTime)./size(Original,1))

    disp("Total Excution Time(s) =")
    display(toc(StartTime))

    disp("Total Excution Time per Image(s) =")
    display(toc(StartTime)./size(Original,1))
end