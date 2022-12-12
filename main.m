[correct_answers, patient_answers] = conductExperiment();


function [total_predicted, total_observed] = conductExperiment(~)
    experimental = Block("experimental"); % initialize experimental block
    control = Block("control"); % initialize control block
    total_predicted = []; 
    total_observed = [];
    
    for i = 1:5
        % control block is done first, proceeded by the experimental block
        [predicted_result, observed_result] = control.conductTrials();
        total_predicted = cat(2, total_predicted, predicted_result);
        total_observed = cat(2, total_observed, observed_result);

        [predicted_result, observed_result] = experimental.conductTrials();
        total_predicted = cat(2, total_predicted, predicted_result);
        total_observed = cat(2, total_observed, observed_result);

    end
end