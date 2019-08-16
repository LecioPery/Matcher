function yEER = Database1_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0.0473684 0.126316 0.247368 0.473684 0.615789 0.757895 0.878947 0.942105 0.968421 0.978947 0.989474 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 0.99 0.99 0.985 0.96 0.89 0.775 0.59 0.405 0.22 0.155 0.115 0.07 0.035 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
