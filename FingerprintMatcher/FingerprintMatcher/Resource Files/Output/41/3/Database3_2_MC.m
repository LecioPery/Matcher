function yEER = Database3_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0105263 0.0684211 0.110526 0.226316 0.421053 0.531579 0.715789 0.821053 0.868421 0.9 0.926316 0.947368 0.957895 0.963158 0.973684 0.994737 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.99 0.975 0.95 0.895 0.755 0.585 0.355 0.185 0.12 0.085 0.05 0.025 0.02 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
