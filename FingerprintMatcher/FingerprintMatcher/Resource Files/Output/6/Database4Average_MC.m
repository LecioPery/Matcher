function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.0105263 0.06 0.150526 0.325263 0.492632 0.634737 0.770526 0.850526 0.92 0.950526 0.976842 0.982105 0.991579 0.993684 0.996842 0.998947 0.998947 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.997 0.995 0.991 0.983 0.944 0.866 0.734 0.575 0.365 0.189 0.111 0.06 0.033 0.015 0.003 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end