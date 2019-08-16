function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00421053 0.00947368 0.0705263 0.185263 0.347368 0.528421 0.654737 0.786316 0.86 0.913684 0.930526 0.950526 0.966316 0.978947 0.987368 0.99579 0.996842 0.997895 0.997895 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.996 0.98 0.924 0.851 0.707 0.573 0.388 0.222 0.143 0.077 0.046 0.024 0.011 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
