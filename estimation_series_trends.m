function [series ] = estimation_series_trends(M, N, poly_degree )
%% Polynomial and linear curve fitting for random series   

%% inputs:
%   N - number of matrix column  

%% outputs
%   series

%% Authors: 
% 

%% References
%

%Generation series
series =randi(16,M,N) + -6;

timeline = [1:1:M];

%%linear fitting
series_poly_fitting(series,1);

%%polynomial fitting
series_poly_fitting(series,poly_degree);

K = 4 %number of window
%window linear fitting
window_poly_fitting(series, 1, K );

%window linear fitting
window_poly_fitting(series, 1, K );

%window polynomial fitting
window_poly_fitting(series, 7, K );







end
