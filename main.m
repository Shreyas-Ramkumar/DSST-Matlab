conductExperiment();


function [total_predicted, total_observed] = conductExperiment(~)
    experimental = Block("experimental");
    control = Block("control");
    total_predicted = [];
    total_observed = [];
    for i = 1:5
        [predicted_result, observed_result] = control.conductTrials();
        total_predicted = cat(2, total_predicted, predicted_result);
        total_observed = cat(2, total_observed, observed_result);
        
        [predicted_result, observed_result] = experimental.conductTrials();
        total_predicted = cat(2, total_predicted, predicted_result);
        total_observed = cat(2, total_observed, observed_result);

    end
end