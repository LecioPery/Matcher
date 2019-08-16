function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00421053 0.0147368 0.051579 0.130526 0.273684 0.458947 0.614737 0.747368 0.847368 0.923158 0.948421 0.972632 0.986316 0.997895 0.997895 0.998947 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.993 0.987 0.978 0.931 0.845 0.685 0.551 0.345 0.165 0.101 0.045 0.028 0.014 0.002 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end