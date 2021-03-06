function [ rmse_windows ] = rmse_window_calculation(  predicted_close_data, deleted_close_data, original_close_data, len_window)
%% Identify Patterns in Time Series Financial Data 
% using:
% 1- step ahead prediction with interpolate methods
% rms error analysis in whole dataset and in running windows   

%% inputs:
%   file_path :  

%% outputs
%   rms: 

%% Authors: 
% 

%% References
% 
% 


errors = []
 deleted_values = fts2mat(deleted_close_data.DeficientDataClose,1)
 deleted_values = deleted_values(:,2)
 predicted_values = fts2mat(predicted_close_data.PredictedDataClose,1)
 predicted_values = predicted_values(:,2)
 original_values = fts2mat(original_close_data.OriginalCloseData,1)
 original_values = original_values(:,2)
 

 n_windows = floor(length(original_close_data)/len_window)
 
 rmse_windows = []
 error_plot_down = []
 error_plot_upper = []
for i=1:n_windows
    original_data_window = original_values((n_windows-1)*len_window+1:n_windows*len_window);
    predicted_data_window = predicted_values((n_windows-1)*len_window+1:n_windows*len_window);
    deleted_data_window = deleted_values((n_windows-1)*len_window+1:n_windows*len_window);
    
    for k = 1:len_window
        if isnan(deleted_data_window(k))
            error = original_data_window(i) - predicted_data_window(i);
            errors = [errors, error^2];
            

        end
    end
    window_rmse = sqrt(mean(errors));
    rmse_windows = [rmse_windows, window_rmse];
    error_plot_down = [error_plot_down, predicted_data_window - window_rmse];
    error_plot_upper = [error_plot_upper, predicted_data_window + window_rmse];

end


% figure, plot(predicted_close_data)
% grid on
% hold on
% plot(error_plot_down)
% hold on
% plot(error_plot_upper)
% legend('Orignal_data', 'Bottom error range','Upper error range')

end

