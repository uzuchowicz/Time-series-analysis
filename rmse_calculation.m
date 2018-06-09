function [ rmse ] = rmse_calculation(  predicted_close_data, deleted_close_data, original_close_data)
%% Calculate root mean square error of prediciton Time Series Financial Data using financial_timeseries_prediciton()
% 

%% inputs:
%    

%% outputs
%   rms: 

%% Authors: 
% 

%% References
% 
% 


errors = []
 deleted_values = fts2mat(deleted_close_data.DeficientDataClose,1)
 predicted_values = fts2mat(predicted_close_data.PredictedDataClose,1)
 original_values = fts2mat(original_close_data.OriginalCloseData,1)
 
 deleted_values = deleted_values(:, 2)
for i=1:length(original_close_data)
    if isnan(deleted_values(i))
        error = original_values(i,2) - predicted_values(i,2)
        errors = [errors, error^2]

    end



end


rmse = sqrt(mean(errors));  % Root Mean Squared Error

figure, plot(predicted_values(:,2))
grid on
hold on
plot(predicted_values(:,2)-rmse)

hold on
plot(predicted_values(:,2)+rmse)
legend('Orignal_data', 'Bottom error range','Uper error range')
end

