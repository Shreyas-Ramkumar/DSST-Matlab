% basic structure for a block (group of 8 trials), including
% sets of expected and observed outputs from 8 experiments, methods for
% initializing cues and probes for trials, and distinguishing between control
% and experimental blocks

classdef Block

    properties
        type % the type of block (can either be experimental or control), 
             % passed in as a parameter in the "experiment" scope.
             % based on this, the program makes the probe sets the same as
             % the cue set (in a control situation) or makes the probe sets
             % random (in an experimental situation)
    end
    
    methods
        
        % class initialization
        function obj = Block(type)
            obj.type = type;
        end


        % Function for conducting 8 trials (as stated in the research
        % papers) by calling the conductTrial function from the Trial
        % class within a for loop. The cue and probes are initialized 
        % within the loop using the assignStimuli method 
        % as each trial should have different cues and probes
        function [predicted_results, observed_results] = conductTrials(obj)
            predicted_results = [];
            observed_results = [];
            for x = 1:8
                [cue, probes] = obj.assignStimuli();
                trial = Trial(cue, probes);
                [predicted, observed] = trial.conductTrial();
                predicted_results = cat(2, predicted_results, predicted);
                observed_results = cat(2, observed_results, observed);
            end
        end


        % Function for assigning stimuli for trial. Works off assign type,
        % which would either be experimental or control. Control would have
        % the cue pairing carried over to the probes (ie. a cue of [1,1]
        % would result in a probe showing [[1,1],[1,1],[1,1],[1,1]]
        function [cue, probes] = assignStimuli(obj)

            numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; % set of numbers to be used for creating cue and probes
            symbols = [0, 1, 2, 3]; % set of symbols (for the sake of making sure all the programs work, numbers will be used here)
            
            cue = [numbers(1, randi([1, 10]), 1, 1); symbols(1, randi([1, 4], 1, 1))]; % cue initialization
            probes = []; % probe initialization (to be added onto by the subsequent lines)
            
            % experimental block will have randomized probes to test memory
            if (obj.type=="experimental")
                for x = 1:4
                    temp = [numbers(1, randi([1, 10], 1, 1)); symbols(1, randi([1, 4], 1, 1))];
                    probes = cat(2, probes, temp);
                end
            
            % control block will have the same probes as the cues
            else
               for x = 1:4
                   probes = cat(2, probes, cue);
               end 
            end
        end 
    end
end