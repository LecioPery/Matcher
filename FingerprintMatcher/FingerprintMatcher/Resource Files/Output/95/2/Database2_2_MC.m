function yEER = Database2_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.0210526 0.0631579 0.147368 0.278947 0.410526 0.531579 0.636842 0.689474 0.784211 0.836842 0.905263 0.957895 0.984211 0.989474 0.994737 0.994737 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.985 0.985 0.975 0.95 0.87 0.76 0.62 0.365 0.22 0.13 0.075 0.05 0.03 0.02 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end