function yEER = Database5_4_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0473684 0.152632 0.336842 0.521053 0.694737 0.810526 0.894737 0.957895 0.978947 0.994737 0.994737 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.99 0.985 0.935 0.85 0.705 0.56 0.37 0.21 0.105 0.035 0.02 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
