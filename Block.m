% basic structure for a block (group of 8 experiments), including
% group of expected and observed outputs from 8 experiments, methods for
% assigning cues and probes for trials, and distinguishing between control
% and experimental blocks

classdef Block

    properties
        type
    end
    
    methods
        
        % class declaration, with the initialization of numbers and symbols
        % sets to pick from. For the purpose of getting the logic working
        % properly, numbers will also be used for the symbols
        function obj = Block(type)
            obj.type = type;
        end


        % Function for conducting 8 trials (as stated in the research
        % papers) by calling the conductTrial function from the Trial
        % class and throwing it in a for loop. The cue and probes are
        % initialized within the loop as each trial should have different
        % cues and probes
        function [predicted_results, observed_results] = conductTrials(obj)
            for x = 1:8
                [cue, probes] = obj.assignStimuli(obj.type);
                [predicted, observed] = Trial.conductTrial(cue, probes);
                predicted_results = cat(2, predicted_results, predicted);
                observed_results = cat(2, observed_results, observed);
            end
        end


        % Function for assigning stimuli for trial. Works off assign type,
        % which would either be experimental or control. Control would have
        % the cue pairing carried over to the probes (ie. a cue of [1,1]
        % would result in a probe showing [[1,1],[1,1],[1,1],[1,1]]
        function [cue, probes] = assignStimuli(obj.type)
            numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; % set of numbers to be used for creating cue and probes
            symbols = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; % set of symbols (for the sake of making sure all the programs work, numbers will be used here)
            cue = [numbers(1, randi([1, 10]), 1, 1), symbols(1, randi([1, 10], 1, 1))];
            if (obj.type=="experimental")
                for x = 1:4
                    app = [numbers(1, randi([1, 9], 1, 1)); symbols(1, randi([1, 9], 1, 1))];
                    probes = cat(2, probes, app);
                end
            else
               for x = 1:4
                   probes = cat(2, probes, cue);
               end 
            end
        end 
    end
end