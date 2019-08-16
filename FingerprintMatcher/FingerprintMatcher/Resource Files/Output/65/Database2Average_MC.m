function yEER = Database2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.00947368 0.0810526 0.213684 0.406316 0.605263 0.741053 0.84 0.903158 0.94 0.961053 0.977895 0.990526 0.99579 0.996842 0.997895 0.998947 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.992 0.989 0.973 0.934 0.854 0.706 0.567 0.359 0.192 0.113 0.053 0.032 0.013 0.004 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
