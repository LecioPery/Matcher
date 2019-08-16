function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00105263 0.0115789 0.0589474 0.166316 0.325263 0.52 0.683158 0.803158 0.869474 0.926316 0.945263 0.968421 0.981053 0.992632 0.997895 0.998947 0.998947 0.998947 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 0.998 0.993 0.986 0.942 0.888 0.753 0.604 0.394 0.201 0.125 0.065 0.04 0.024 0.011 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end