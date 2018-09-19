function [name_out, name_in] = getDirName(name_in)
%% getDirName: function to parse folder name from current path
% This is simple really
%
% Usage:
%   [name_out, name_in] = getDirName(name_in)
%
% Input:
%   name_in: path name string to parse
%
% Output:
%   name_out: string of last file or directory at end of input path
%

if isunix
    p = regexp(name_in, '\/', 'split');
else
    p = regexp(name_in, '\\', 'split');
end

name_out = p{end};

end