function yEER = Database1_3_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.00526316 0.0105263 0.0842105 0.184211 0.336842 0.452632 0.578947 0.694737 0.8 0.873684 0.931579 0.942105 0.952632 0.973684 0.978947 0.984211 0.984211 0.994737 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.99 0.98 0.93 0.895 0.795 0.715 0.465 0.275 0.12 0.055 0.04 0.025 0.02 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
