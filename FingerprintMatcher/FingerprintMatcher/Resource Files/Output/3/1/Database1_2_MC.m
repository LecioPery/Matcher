function yEER = Database1_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0789474 0.205263 0.347368 0.510526 0.673684 0.789474 0.868421 0.915789 0.942105 0.963158 0.984211 0.994737 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.995 0.99 0.985 0.935 0.84 0.72 0.45 0.285 0.17 0.09 0.04 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end