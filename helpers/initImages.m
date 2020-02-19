%% Initalize Image Store
fld = dir('/home/jbustamante/Dropbox/EdSpalding_Lab/Data/ashley/rootkinematics/Col-0_1/');
ds = imageDatastore(fld(1).folder);
clear fld;

%% Load and First Image
im = ds.readimage(1);
I = median(im,3);

% Top is grayscale, bottom is for binaraization algorithm
subplot(211); 
imagesc(I);
colormap gray;
axis image;

%% 
