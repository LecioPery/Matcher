function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00526316 0.0368421 0.142105 0.289474 0.465263 0.61579 0.748421 0.838947 0.89579 0.934737 0.958947 0.974737 0.990526 0.993684 0.99579 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.996 0.996 0.994 0.988 0.947 0.871 0.729 0.581 0.368 0.183 0.108 0.054 0.03 0.016 0.003 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end