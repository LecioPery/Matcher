function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.0178947 0.0642105 0.164211 0.336842 0.513684 0.676842 0.785263 0.855789 0.903158 0.92421 0.954737 0.970526 0.981053 0.990526 0.993684 0.997895 0.998947 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 0.996 0.994 0.98 0.939 0.861 0.73 0.596 0.394 0.211 0.136 0.068 0.041 0.022 0.01 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end