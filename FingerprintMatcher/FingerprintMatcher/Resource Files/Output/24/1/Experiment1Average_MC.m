function yEER = Experiment1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00263158 0.00263158 0.0131579 0.0657895 0.180263 0.325 0.497368 0.630263 0.768421 0.856579 0.915789 0.946053 0.961842 0.981579 0.993421 0.994737 0.998684 0.998684 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.9975 0.995 0.99125 0.98125 0.94 0.865 0.73125 0.5975 0.3925 0.215 0.13125 0.06875 0.04125 0.02125 0.0075 0.005 0.005 0.00375 0.00125 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
