function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00421053 0.00526316 0.0178947 0.0768421 0.172632 0.349474 0.511579 0.649474 0.790526 0.877895 0.936842 0.957895 0.976842 0.986316 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.998 0.991 0.98 0.929 0.864 0.734 0.614 0.409 0.22 0.129 0.071 0.043 0.022 0.007 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
