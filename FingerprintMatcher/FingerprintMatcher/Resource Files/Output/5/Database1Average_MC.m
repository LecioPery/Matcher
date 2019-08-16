function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.00421053 0.0126316 0.0473684 0.128421 0.286316 0.474737 0.597895 0.755789 0.845263 0.896842 0.944211 0.975789 0.989474 0.99579 0.996842 0.998947 0.998947 0.998947 0.998947 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.991 0.981 0.939 0.865 0.731 0.575 0.362 0.212 0.133 0.073 0.043 0.019 0.002 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end