function [first_crds , crds] = getCoordinatesFromFile(dout, xyin, frm)
%% getCoordinatesFromFile: load x-/y-coordinates from ouputted CSV file
% Description
%
% Usage:
%    OUT = getCoordinatesFromFile(IN, sav, vis)
%
% Input:
%    IN:
%    sav: boolean to save output as .mat file
%    vis: boolean to visualize output
%
% Output:
%    OUT:
%
% Author Julian Bustamante <jbustamante@wisc.edu>
%

%%
switch nargin
    case 1
        xyin = 'xyCoord.csv';
        frm  = 1;
    case 2
        frm = 1;
    case 3
        
    otherwise
        fprintf(2, 'Input error [%2 given, 3 expected]\n', nargin);
end

% Check if input has xyin and then load in CSV file
[~, din, ext] = fileparts(dout);
if strcmpi([din , ext], xyin)
    csvIn = dout;
else
    csvIn = [dout , filesep , xyin];
end

crds  = csvread(csvIn);

% Get information about data and reshape to expected size
nfrms = round(size(crds, 1));
npts  = round(size(crds, 2) / 2);
crds  = fliplr(permute(reshape(crds, [nfrms , 2 , npts]), [3 , 2 , 1]));

% Get only the coordinates from frm
first_crds = crds(:,:,frm);

end


