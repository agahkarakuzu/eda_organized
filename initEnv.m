% 
% 1 - Check if version requirements
% are satisfied and the packages are 
% are installed/loaded:
% 	Octave > 3.6.0  
% 		- image 
%   	- optim 
%   	- struct 
%   	- statistics 
%
% 	MATLAB > R2016b
%
% 2 - Add project to the O/M path

function initEnv

if isOctave

% Exit if min version is not satisfied
if ~compare_versions(OCTAVE_VERSION,'3.6.0','>=')
	error('Minimum required Octave version: 3.6.0');
end

installlist = {'struct','io','statistics','optim','image'};
for ii=1:length(installlist)
        try
        	% Try loading Octave packages
            disp(['loading ' installlist{ii}])
            pkg('load',installlist{ii})
        
        catch
            errorcount = 1;
            while errorcount % Attempt twice in case installation fails
                try
                    pkg('install','-forge',installlist{ii})
                    pkg('load',installlist{ii})
                    errorcount = 0;
                catch err
                    errorcount = errorcount+1;
                    if errorcount>2
                        error(err.message)
                    end
                end
            end
        end
end
	


else % MATLAB ----------------------------

if verLessThan('matlab','9.1')
	error('Sorry, minimum required version is R2016b. :(');
end

end

% If external dir is empty throw an exception 
% and ask user to update submodules.
if numel(dir('external')) <= 2 % Means that the external is empty
	error(['Git submodules are not cloned! \n' ...
		  'try this in your terminal: \n ...'
		  'git submodule update --recursive ']);	
else 
	addpath(genpath(pwd));
end		

disp('Successfully added to the path!');

end

%%
%% Return: true if the environment is Octave.
%%
function retval = isOctave
  persistent cacheval;  % speeds up repeated calls

  if isempty (cacheval)
    cacheval = (exist ("OCTAVE_VERSION", "builtin") > 0);
  end

  retval = cacheval;
end
