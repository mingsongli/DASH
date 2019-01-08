function[m] = fileCheck( file, readOnly )
%% Checks that a gridded .mat file exists. Returns a writable or read-only 
% matfile object, as required.
%
% m = fileCheck( file )
% Returns a writable matfile object.
%
% m = fileCheck( file, 'readOnly' )
% Returns a read-only matfile object.
%
% ----- Inputs -----
%
% file: The name of a gridded .mat file. A string.
%
% ----- Outputs -----
%
% m: A matfile object for a gridded .mat file.

% Check that the file is a .mat file
if isstring(file)
    file = char(file);
end
if ~strcmpi( file(end-3:end), '.mat' )
    error('File must be a .mat file.');
end

% Get the matfile
if exist('readOnly', 'var') && strcmpi(readOnly, 'readOnly')
    m = matfile(file);
elseif exist('readOnly', 'var')
    error('Unrecognized input');
else
    m = matfile( file, 'Writable', true );
end

% Check that it contains the required fields
vars = who(m);

if ~ismember( 'gridData', vars )
    error('The %s file is missing the ''gridData'' variable.', file);
elseif ~ismember( 'dimID', vars )
    error('The %s file is missing the ''dimID'' variable.', file);
elseif ~ismember( 'meta', vars )
    error('The %s file is missing the ''meta'' variable.', file);
end

end