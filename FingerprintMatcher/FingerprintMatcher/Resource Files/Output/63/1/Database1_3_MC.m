function yEER = Database1_3_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0210526 0.0473684 0.147368 0.289474 0.442105 0.594737 0.742105 0.847368 0.915789 0.963158 0.984211 0.989474 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.995 0.985 0.925 0.855 0.74 0.655 0.46 0.265 0.155 0.105 0.07 0.035 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
