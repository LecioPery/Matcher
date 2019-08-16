function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.0031579 0.0126316 0.06 0.148421 0.329474 0.521053 0.648421 0.761053 0.824211 0.882105 0.92 0.941053 0.957895 0.978947 0.986316 0.994737 0.996842 0.997895 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.996 0.994 0.99 0.982 0.94 0.856 0.724 0.58 0.372 0.188 0.11 0.06 0.039 0.023 0.013 0.012 0.012 0.009 0.003 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end