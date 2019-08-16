function yEER = Database2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0115789 0.0715789 0.168421 0.332632 0.506316 0.666316 0.797895 0.878947 0.936842 0.966316 0.983158 0.992632 0.996842 0.997895 0.997895 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.996 0.993 0.981 0.935 0.847 0.696 0.555 0.35 0.17 0.111 0.073 0.052 0.031 0.006 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end