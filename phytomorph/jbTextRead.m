function textout = jbTextRead(textin, fmt, delim)
%% jbTextRead: Open and read a text file
switch nargin
    case 1
        fmt   = '%s';
        delim = '\n';
    case 2
        delim = '\n';
    case 3
    otherwise
        fprintf(2, 'Error with number of inputs\n');
        return;
end

%%
fid     = fopen(textin, 'r');
textout = textscan(fid, fmt, 'Delimiter', delim);
textout = textout{1};

end

