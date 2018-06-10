function [ series_segment_trend, trend_series  ] = window_poly_fitting( series, poly_degree , K)
%% Polynomial and linear curve fitting for random series   

%% inputs:
% N - number of matrix column
% poly_degree
% K - window of fitting segments

%% outputs
%   trend series

%% Authors: 
% 

%% References
%

timeline = [1:1:length(series)];

len_windows = floor(length(series)/K);
trend_series = [];
for i=1:K
    series_segment = series((K-1)*len_windows +1 : K*len_windows,:);
    series_segment_trend = series_poly_fitting(series_segment, poly_degree, 1);
    trend_series = [trend_series, series_segment_trend];

    
end


%visualization
figure, 
subplot(3,1,1)
title('Window trend fitting')
plot(timeline, series(:,1))
hold on
plot(timeline, trend_series(1,:))
if poly_degree == 1
    legend('Series 1', 'Linear fitting')
else
    legend('Series 1', ['Polynomial fitting of degree ', num2str(poly_degree)])
end
hold on
subplot(3,1,2)
plot(timeline,series(:,2))
hold on
plot(timeline, trend_series(2,:))
if poly_degree == 1
    legend('Series 2', 'Linear fitting')
else
    legend('Series 2', ['Polynomial fitting of degree ', num2str(poly_degree)])
end
    
hold on
subplot(3,1,3)
plot(timeline,series(:,3))

hold on
plot(timeline, trend_series(3,:))
grid on
if poly_degree == 1
    legend('Series 3', 'Linear fitting')
else
    legend('Series 3', ['Polynomial fitting of degree ', num2str(poly_degree)])
end






end
