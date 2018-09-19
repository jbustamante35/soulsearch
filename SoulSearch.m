%% SoulSearch: class for generating a contour around first image
% This class is meant to find the root in the first image of a
% dataset for root kinematics software. This class contains methods for
% loading and processing the first image, and for running machine learning
% algorithms that will form a contour around the root.

classdef SoulSearch < handle
    properties (Access = public)
        DataSet        
    end
    
    properties (Access = private)
        ImageStore
        Image
    end
    
    methods (Access = public)
        %% Constructor and primary methods
        function obj = SoulSearch(varargin)
            %% Constructor method for single SoulSearch object
            if ~isempty(varargin)
                % Parse inputs to set properties
                args = obj.parseConstructorInput(varargin);
                
                fn = fieldnames(args);
                for k = fn'
                    obj.(cell2mat(k)) = args.(cell2mat(k));
                end
                
                obj.Image  = ...
                    struct('gray', [], 'mask', [], 'labels', []);
            else
                obj.Image  = ...
                    struct('gray', [], 'mask', [], 'labels', []);
            end
            
        end
        
    end
    
    methods (Access = public)
        %% Various helper methods
        function I = getImage(varargin)
            %% Return image data for ContourJB at desired frame [frm, req]
            % User can specify which image from structure with 3rd parameter
            switch nargin
                case 1
                    % Full structure of image data at all frames
                    obj = varargin{1};
                    I   = obj.Image;
                    
                case 2
                    % Get requested image type
                    obj = varargin{1};
                    req = varargin{2};
                    if isfield(obj.Image, req)                         
                        I   = loadImage(obj, req);
                    else
                        fn  = fieldnames(obj.Image);
                        str = sprintf('%s, ', fn{:});
                        fprintf(2, 'Requested field must be either: %s\n', str);
                    end
                    
                otherwise
                    fprintf(2, 'Error requesting data.\n');
                    return;
            end
        end
        
    end
    
    methods (Access = private)
        %% Private helper methods
        function args = parseConstructorInput(varargin)
            %% Parse input parameters for Constructor method
            p = inputParser;
            p.addOptional('DataSet', pwd);
            p.addOptional('ImageStore', []);
            p.addOptional('Image', []);
            
            % Parse arguments and output into structure
            p.parse(varargin{2}{:});
            args = p.Results;
        end
        
        function im = loadImage(obj, req)
            %% Load and return image from Image Data Store
            im = obj.ImageStore.readimage(1);
        end
        
    end
end
