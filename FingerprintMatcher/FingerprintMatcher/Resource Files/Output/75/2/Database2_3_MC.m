function yEER = Database2_3_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0421053 0.131579 0.284211 0.505263 0.684211 0.852632 0.910526 0.936842 0.963158 0.994737 1 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.99 0.99 0.945 0.835 0.71 0.595 0.425 0.25 0.14 0.085 0.05 0.02 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
