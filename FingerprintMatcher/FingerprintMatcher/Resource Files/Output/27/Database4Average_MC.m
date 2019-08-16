function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00526316 0.0157895 0.0463158 0.144211 0.289474 0.456842 0.627368 0.781053 0.863158 0.931579 0.954737 0.975789 0.986316 0.992632 0.994737 0.997895 0.997895 0.998947 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.995 0.991 0.978 0.93 0.857 0.73 0.593 0.383 0.229 0.134 0.074 0.048 0.026 0.008 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end