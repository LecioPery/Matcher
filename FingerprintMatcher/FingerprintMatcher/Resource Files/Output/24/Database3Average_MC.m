function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.0031579 0.00526316 0.0115789 0.048421 0.126316 0.275789 0.444211 0.584211 0.712632 0.811579 0.885263 0.929474 0.962105 0.978947 0.988421 0.991579 0.994737 0.998947 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.996 0.991 0.982 0.936 0.861 0.729 0.602 0.389 0.203 0.121 0.057 0.036 0.019 0.005 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end