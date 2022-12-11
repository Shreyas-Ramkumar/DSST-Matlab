% basic structure for a DSST Trial, including expected and observed
% results, cue initialization, and probe initialization

classdef Trial

    properties
        % variables used in class. actual values of cue and probes (ie. the
        % symbols and numbers are defined in the "experiment" parent class
        % as value definition there will allow abstraction for functions in
        % Trial and Block classes
       
        cue
        probes


    end

    methods

        % initialization of Trial class to an "obj" object. this will allow
        % class properties to be referred throughout class methods. as
        % stated above, cue and probe values are parameters in this class
        % as they can be defined properly in the "experiment" parent class.

        function obj = Trial(cue, probes)
            obj.cue = cue;
            obj.probes = probes;
        end
        
        function [expected, observed] = conductTrial(obj)
            expected = obj.predictResult();
            observed = obj.getPatientInput();
        end

        % predictResults function used to get the right answer for given
        % cue and probes. Used as a comparison for patient input
        function expected_result = predictResult(obj)
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
            observed_result = input("Type 'R' if the cue is present in the probe, type 'L' if the cue is not present in the probe. ");
        end
    end
end