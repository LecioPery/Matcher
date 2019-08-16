function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00210526 0.00736842 0.0568421 0.134737 0.287368 0.453684 0.602105 0.742105 0.83579 0.915789 0.942105 0.957895 0.972632 0.982105 0.989474 0.994737 0.994737 0.996842 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.991 0.987 0.976 0.935 0.859 0.739 0.602 0.388 0.208 0.131 0.075 0.046 0.026 0.011 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
