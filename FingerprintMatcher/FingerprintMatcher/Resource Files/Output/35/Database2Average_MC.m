function yEER = Database2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00105263 0.00631579 0.0505263 0.162105 0.332632 0.504211 0.661053 0.778947 0.865263 0.914737 0.944211 0.969474 0.98 0.989474 0.994737 0.996842 0.997895 0.997895 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.995 0.992 0.98 0.939 0.85 0.704 0.566 0.359 0.19 0.133 0.07 0.048 0.032 0.009 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
