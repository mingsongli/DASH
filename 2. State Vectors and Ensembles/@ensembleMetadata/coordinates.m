function[coord] = coordinates( obj )
% Gets point lat-lon coordinates for the entire ensemble.
%
% coord = obj.coordinates
%
% *** Returns NaN coordinates for spatial means and variables lacking
% lat-lon coordinate information.
%
% ----- Outputs -----
%
% coord: Lat-lon coordinates of each state vector element. (nState x 2)

% Preallocate
coord = NaN( obj.varLimit(end), 2 );

% Try to extract coordinates from each variable. Just leave as NaN if it
% fails, or if they are spatial means.
for v = 1:numel(obj.varName)
    try
        latlon = obj.getLatLonSequence( obj.varName(v) );
    catch
        warning('Unable to determine coordinates for variable %s.', obj.varName(v));
    end
    
    % Replicate over a complete grid
    nIndex = prod(obj.varSize(v,:));
    nRep = nIndex ./ size(latlon,1);
    latlon = repmat( latlon, [nRep,1] );
    
    % Reduce if a partial grid
    if obj.partialGrid(v)
        latlon = latlon(obj.partialH{v}, :);
    end
    
    % Try concatenating the data
    try
        coord( obj.varIndices(obj.varName(v)), : ) = latlon;
    catch
        warning('Cannot concatenate coordinates for variable %s.', obj.varName(v) );
    end
end

end