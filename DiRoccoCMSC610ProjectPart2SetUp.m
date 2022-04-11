% DiRocco CMSC 601 Project Part 2 Setup
% Shawn DiRocco

% File Path of Images
InputfilePath = 'C:\Users\mail9\Desktop\DiRoccoCMSC601Project\Input Images\Cancerous cell smears\*.bmp';

% Output Path of Images
OutputfilePath = 'C:\Users\mail9\Desktop\DiRoccoCMSC601Project\Output\';

% Amount of Each Type of Cell
cyl = 50;
inter = 50;
let = 100;
modc = 100;
para = 50;
super = 50;
svar = 100;

% Grayscale Weights
cR = 0.299;
cG = 0.587;
cB = 0.114;

% Clear Output Folder
% To Clear Input 'Yes'
% Else Input Anything Else
Clear = 'Yes';

% Copy Input Images to Output
% To Copy Input 'Yes'
% Else Input Anything Else
Copy = 'Yes';

% Detect Edges using 1st Derivative
% To Detect Edges Input 'Yes'
% Else Input Anything Else
FirstEdge = 'Yes';

% Threshold of Edge Detection
EdgeThreshold = 10;

% Dilation of Image
% To Dilate Image Input 'Yes'
% Else Input Anything Else
Dilation = 'Yes';

%Dilation Structure Element
DSE = [0 1 0; 1 1 1; 0 1 0];

%The Level of Dilation
DilationLevels = 20;

% Erosion of Image
% To Erode Image Input 'Yes'
% Else Input Anything Else
Erode = 'Yes';

%Erosion Structure Element
ESE = [0 1 0; 1 1 1; 0 1 0];

%The Level of Erosion
ErosionLevels = 20;

% Use Erosian and Dialation for Noise Removal
% To Use Erosian and Dialation for Noise Removal Input 'Yes'
% Else Input Anything Else
ErodeandDilation = 'Yes';

%Level of Noise Removal
NoiseLevel = 3;

% OTSU Histogram Thresholding of Image
% To OTSU Histogram Thresholding Input 'Yes'
% Else Input Anything Else
OTSU = 'Yes';

% K Means Clustering of Image
% To K Means Clustering Input 'Yes'
% Else Input Anything Else
KMeans = 'Yes';

% Value of k
k = 3;

%K Mean Iteration Value
Iterations = 10;

% Mean Shift Segmentation of Image
% To Mean Shift Segmentation  Input 'Yes'
% Else Input Anything Else
Meanshift = 'Yes';

% Spatial Kernel
sk = 10;

% Feature Kernal
fk = 16;

% Convergence Criterion
MeanshiftIterations = 10;