function yEER = Database5_1_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0157895 0.0421053 0.110526 0.278947 0.447368 0.557895 0.710526 0.831579 0.889474 0.931579 0.968421 0.994737 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.985 0.98 0.98 0.95 0.875 0.74 0.59 0.335 0.19 0.125 0.07 0.04 0.025 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
