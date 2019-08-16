function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0157895 0.0736842 0.183158 0.370526 0.566316 0.712632 0.828421 0.886316 0.923158 0.944211 0.968421 0.976842 0.988421 0.992632 0.996842 0.996842 0.998947 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.994 0.987 0.976 0.928 0.829 0.688 0.558 0.382 0.215 0.151 0.074 0.052 0.032 0.011 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
