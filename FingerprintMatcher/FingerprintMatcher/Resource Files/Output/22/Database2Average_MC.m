function yEER = Database2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00736842 0.0526316 0.137895 0.285263 0.478947 0.631579 0.765263 0.848421 0.902105 0.932631 0.955789 0.969474 0.985263 0.991579 0.99579 0.997895 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.999 0.997 0.988 0.952 0.895 0.785 0.651 0.414 0.216 0.123 0.055 0.029 0.011 0.004 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end