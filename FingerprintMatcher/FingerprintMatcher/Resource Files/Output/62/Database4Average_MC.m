function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0136842 0.0421053 0.116842 0.292632 0.483158 0.630526 0.776842 0.877895 0.943158 0.968421 0.98421 0.993684 0.998947 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.997 0.997 0.993 0.977 0.943 0.868 0.728 0.588 0.387 0.2 0.122 0.056 0.034 0.016 0.002 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
