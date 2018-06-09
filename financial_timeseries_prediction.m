function [ predicted_close_data, deleted_close_data, original_close_data  ] = financial_timeseries_prediction( file_path , n_deleted )
%% Identify Patterns in Time Series Financial Data 
% using:
% 1- step ahead prediction with interpolate methods
% rms error analysis in whole dataset and in running windows   

%% inputs:
%   file_path 

%% outputs:
%predicted_close_data
%deleted_close_data
%original_close_data

%% Authors: 
% 

%% References
% 
% 

% data initialization

load(file_path)

data_close = financial_timeseries_data.Zamkniecie;

data_timestamps = cellstr(financial_timeseries_data.Data);

original_close_data = fints(data_timestamps, data_close, {'OriginalCloseData'}, 1, 'Close Financial Time Series');

%plotting real data
chartfts(original_close_data); 

figure,
plot(original_close_data.OriginalCloseData);
grid on

%delete random values of timeseries 
index = randperm(length(data_timestamps));
deleted_indices = index(1:n_deleted);
deleted_close_data = fints(data_timestamps, data_close, {'DeficientDataClose'}, 1, 'Close Financial Time Series');
deleted_close_data(deleted_indices).DeficientDataClose = NaN;

figure,
plot(deleted_close_data.DeficientDataClose);
grid on

%values prediction
predicted_close_data = fints(data_timestamps, data_close, {'PredictedDataClose'}, 1, 'Close Financial Time Series');
predicted_close_data(deleted_indices).PredictedDataClose = NaN;

predicted_close_data = fillts(predicted_close_data,'nearest');

figure
plot(predicted_close_data.PredictedDataClose);
grid on




end

