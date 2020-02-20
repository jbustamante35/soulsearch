function DAT = runSoulSearch(dirpath, mthIdx, outpath, crdsmap)
%% runSoulSearch: run full kinematics pipeline headless
% Description
%
% Usage:
%    runSoulSearch(dirpath, mthIdx, fIdx, crdsmap)
%
% Input:
%    dirpath: path to directory of time-lapses
%    mthIdx: method selection index (defaults to 4 [Kinematics Steady State]
%    fIdx: figure handle index [defaults to figure 1]
%    outpath: path to output directory
%    crdsmap: coordinates for qc and midline
%
% Output:
%    DOUT: output data object
%
% Author Julian Bustamante <jbustamante@wisc.edu>
%

%% Get the choosen method for reading files
% Run files selection list if no method selected
if ~nargin
    dirpath = uipickfiles('Prompt', 'Select Directories to Images');
    mthIdx  = 4;
    outpath = '~';
else
    dirpath = cellstr(dirpath);
end

%% Read in coordinates for Midline and QC
if nargin < 4
    [qc , mline] = deal([]);
else
    qc    = crdsmap(1,:);
    mline = crdsmap(2:end,:);
end

%% Get list of methods
methodList = getMethodList;

%% Set method and output location
para.jobType        = methodList{mthIdx};                 % Method
para.fileList       = dirpath;                            % Path to images
para.basePath       = [outpath , filesep , 'phytoMorph']; % Path to output
para.iPlantUser     = char;                               % iPlant user name
para.local_irodsMNT = '~';                                % Localmount location (default to ~)
para.mline          = mline;
para.qc             = qc;

%% Generate and Excecute jobs
jP  = generateJob(para);
DAT = jP.run();

end

function methodList = getMethodList
%% getMethodList:
%

try
    REPODIR    = fileparts(fileparts(matlab.desktop.editor.getActiveFilename));
    METHODPATH = 'methodList.txt';
    FIN        = [REPODIR , filesep , METHODPATH];
    fid        = fopen(FIN, 'r');
    methodList = textscan(fid, '%s', 'Delimiter', '\n');
    methodList = methodList{1};
catch
    % Backup List if failed [this method is too inconsistent]
    fprintf('...Reverting to hard-coded methodList\n');
    methodList = { ...
        'Seed Size'                           ; ...
        'Root Morphometrics'                  ; ...
        'Root Morphometrics V2'               ; ...
        'Kinematics with Steady State Flow'   ; ...
        'Kinematics without Steady State Flow'; ...
        'Tip Tracker'                         ; ...
        'Train Particle Learner'              ; ...
        'Kinematics newI'};
end

end

