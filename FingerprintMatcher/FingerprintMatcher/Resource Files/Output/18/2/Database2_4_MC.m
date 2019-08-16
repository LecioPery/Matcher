function yEER = Database2_4_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0157895 0.0421053 0.115789 0.226316 0.384211 0.531579 0.694737 0.8 0.921053 0.947368 0.984211 0.994737 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 0.99 0.985 0.975 0.95 0.91 0.78 0.66 0.43 0.235 0.105 0.035 0.015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
