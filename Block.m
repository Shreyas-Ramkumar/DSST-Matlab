% basic structure for a block (group of 8 experiments), including
% group of expected and observed outputs from 8 experiments, methods for
% assigning cues and probes for trials, and distinguishing between control
% and experimental blocks

classdef Block

    properties
        type
        numbers
        symbols
    end
    
    methods
        % class declaration, with the initialization of numbers and symbols
        % sets to pick from. For the purpose of getting the logic working
        % properly, numbers will also be used for the symbols
        function obj = Block(~)
            obj.numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            obj.symbols = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        end

        
        % Function for conducting 8 trials (as stated in the research
        % papers) by calling the conductTrial function from the Trial
        % class and throwing it in a for loop. The cue and probes are
        % initialized within the loop as each trial should have different
        % cues and probes
        function [predicted_results, observed_results] = conductTrials(~)
            for x = 1:8
                obj.numbers;
                [predicted, observed] = Trial.conductTrial(cue, probes);
                predicted_results = cat(2, predicted_results, predicted);
                observed_results = cat(2, observed_results, observed);
            end
        end


        % Function for assigning stimuli for trial. Works off assign type,
        % which would either be experimental or control. Control would have
        % the cue pairing carried over to the probes (ie. a cue of [1,1]
        % would result in a probe showing [[1,1],[1,1],[1,1],[1,1]]
        function [cue, probes] = assignStimuli(numbers, symbols, type)
            cue = [numbers(randi([1, 9], 1, 1)); symbols(randi([1, 9], 1, 1))];
            if (type=="experimental")
                for x = 1:4
                    app = [numbers(randi([1, 9], 1, 1)); symbols(randi([1, 9], 1, 1))];
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