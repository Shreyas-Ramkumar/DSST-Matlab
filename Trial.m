% basic structure for a DSST Trial, including the methods for the computer
% to check whether the cue is in a probe set and to get the patient to tell
% whether the cue is in a probe set

classdef Trial

    properties
        % cue and probe values are initialzied in the block scope and 
        % passed as parameters to the trial class when initialized. This 
        % is so that every time a trial is conducted, there's a new set
        % of cues and probes. Plus, it's easier to just pass the cue
        % and probes as parameters rather than initialize them within
        % the trial class itself as scope management will be a lot easier
        % :)
       
        cue
        probes


    end

    methods

        % class initialization
        function obj = Trial(cue, probes)
            obj.cue = cue;
            obj.probes = probes;
        end
        
        % method to conduct trial, returns the expected value (ie. the
        % correct result based on whether the cue is in the probe or not)
        % and the observed value (ie. the patient's answer)
        function [expected, observed] = conductTrial(obj)
            expected = obj.getCorrectAnswer();
            observed = obj.getPatientInput();
        end


        % predictResults function used to get the right answer for given
        % cue and probes. Used as a comparison for patient input
        function expected_result = getCorrectAnswer(obj)
            if ismember(obj.cue, obj.probes)
                expected_result = "R";
            else 
                expected_result = "L";
            end       
        end

        
        % getPatientInput function used to get the patient's answer and
        % store it for comparison with the expected answer
        function observed_result = getPatientInput(obj)
            disp(obj.cue);
            disp(obj.probes);
            observed_result = input("Type 'R' if the cue is present in the probe, type 'L' if the cue is not present in the probe. ", "s");
        end
    end
end