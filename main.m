%Main exection program
close all
clear all 
clc
%initializing parametes

%%Part I
path ='C:\Users\Ula\Time-series-analysis\data\financial_timeseries_data.mat';

%set level of data deficiency 
n_deleted = 50;

[ predicted_close_data, deleted_close_data, original_close_data  ]  = financial_timeseries_prediction(path, n_deleted);

rmse_calculation(  predicted_close_data, deleted_close_data, original_close_data)
%set length of window
len_window = 25
[ rmse_window ] = rmse_window_calculation(  predicted_close_data, deleted_close_data, original_close_data, len_window)

%%Part II

N = 3; %number of matrix column
M = 100; %series length
estimation_series_trends(M, N,7);

