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
        function obj = Block(~)
            obj.numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            obj.symbols = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        end
        function [predicted_results, observed_results] = conductTrials(~)
            for x = 1:8
                obj.numbers;
                [predicted, observed] = Trial.conductTrial(cue, probes);
                predicted_results = cat(2, predicted_results, predicted);
                observed_results = cat(2, observed_results, observed);
            end
        end
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
        function [cue, probes] = assignContStimuli(numbers, symbols)
            cue = [numbers(randi([1, 9], 1, 1)); symbols(randi([1, 9], 1, 1))];
            for x = 1:4
                probes = cat(2, probes, cue);
            end
        end 
            
    end
end