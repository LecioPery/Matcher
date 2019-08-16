function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00105263 0.00631579 0.0526316 0.14 0.287368 0.471579 0.611579 0.752632 0.842105 0.90421 0.935789 0.962105 0.976842 0.983158 0.987368 0.992632 0.99579 0.997895 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.996 0.994 0.991 0.979 0.943 0.886 0.752 0.617 0.389 0.235 0.132 0.076 0.041 0.02 0.007 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end