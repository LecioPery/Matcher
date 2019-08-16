function yEER = Experiment3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00394737 0.0118421 0.0315789 0.134211 0.285526 0.486842 0.665789 0.796053 0.873684 0.925 0.956579 0.973684 0.980263 0.990789 0.996053 0.998684 1 1 1 1];
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
