function yEER = Database2_4_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0263158 0.0894737 0.163158 0.310526 0.510526 0.678947 0.826316 0.9 0.931579 0.973684 0.978947 0.989474 0.994737 0.994737 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 1 0.985 0.975 0.925 0.83 0.695 0.46 0.2 0.095 0.045 0.02 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
