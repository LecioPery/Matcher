function yEER = Experiment3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00394737 0.00526316 0.0157895 0.0434211 0.132895 0.289474 0.438158 0.611842 0.755263 0.847368 0.902632 0.936842 0.960526 0.968421 0.984211 0.993421 0.996053 1 1 1 1];
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