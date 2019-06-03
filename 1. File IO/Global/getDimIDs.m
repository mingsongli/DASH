function[dimID, specs, varName, lonDim, latDim, levDim, timeDim, runDim, triDim] = getDimIDs
%% This creates string IDs for all dimensions that can possibly occur in gridded data.
%
% [dimID, specs, varName, lonDim, latDim, levDim, timeDim, runDim, triDim] = getDimIDs

% Variable specifications.
specs = "specs";

% Variable name in ensemble metadata
varName = "var";

% Longitude (x coordinate)
lonDim = "lon";

% Latitude (y coordinate)
latDim = "lat";

% Level (z / height coordinate)
levDim = "lev";

% Time 
timeDim = "time";

% Ensemble
runDim = "run";

% Tripole
triDim = "tri";

% All grid dimensions
dimID = [lonDim, latDim, levDim, timeDim, runDim, triDim];

end