function base = readFileDir()
% readFileDir Reads current file directory
% 
%   Copyright 2020 Yu-Jui Christopher Lai

base = pwd;
dir_processor = 'Rheometer-data-processing';
dir_idx = strfind(base,dir_processor);
base = [convertCharsToStrings(base(1:dir_idx + length(dir_processor) - 1)) + filesep + 'Measurement files' + filesep];

end