function [ trend_series ] = series_poly_fitting( series, poly_degree, plotting)
%% Polynomial and linear curve fitting for random series   

%% inputs:
%   N - number of matrix column  

%% outputs
%   rms: 

%% Authors: 
% 

%% References
%

if nargin < 3
    plotting = 1;
end
timeline = [1:1:length(series)];
%%Polynomial fitting 
fit_series1 = polyfit(timeline', series(:,1),poly_degree);
trend_series1 = polyval(fit_series1, timeline);

fit_series2 = polyfit(timeline', series(:,2),poly_degree);
trend_series2 = polyval(fit_series2, timeline);

fit_series3 = polyfit(timeline', series(:,3),poly_degree);
trend_series3 = polyval(fit_series3, timeline);

%visualization
if plotting
    figure, 
    subplot(3,1,1)
    plot(timeline, series(:,1))
    hold on
    plot(timeline, trend_series1)
    if poly_degree == 1
        legend('Series 1', 'Linear fitting')
    else
        legend('Series 1', ['Polynomial fitting of degree ', num2str(poly_degree)])
    end
    hold on
    subplot(3,1,2)
    plot(timeline,series(:,2))
    hold on
    plot(timeline, trend_series2)
    if poly_degree == 1
        legend('Series 2', 'Linear fitting')
    else
        legend('Series 2', ['Polynomial fitting of degree ', num2str(poly_degree)])
    end

    hold on
    subplot(3,1,3)
    plot(timeline,series(:,3))

    hold on
    plot(timeline, trend_series3)
    grid on
    if poly_degree == 1
        legend('Series 3', 'Linear fitting')
    else
        legend('Series 3', ['Polynomial fitting of degree ', num2str(poly_degree)])
    end
end
trend_series = [trend_series1; trend_series2; trend_series3];




end
