function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0147368 0.0494737 0.132632 0.287368 0.468421 0.594737 0.715789 0.796842 0.853684 0.882105 0.915789 0.944211 0.964211 0.975789 0.987368 0.993684 0.998947 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.993 0.987 0.98 0.963 0.916 0.828 0.662 0.545 0.377 0.237 0.146 0.078 0.052 0.032 0.018 0.016 0.016 0.012 0.004 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end