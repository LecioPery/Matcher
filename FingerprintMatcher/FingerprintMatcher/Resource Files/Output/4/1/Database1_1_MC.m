function yEER = Database1_1_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.0315789 0.1 0.252632 0.415789 0.563158 0.673684 0.810526 0.884211 0.952632 0.968421 0.973684 1 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.995 0.985 0.955 0.875 0.73 0.635 0.425 0.255 0.16 0.115 0.07 0.02 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end