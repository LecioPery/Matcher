function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.0168421 0.0610526 0.138947 0.297895 0.476842 0.624211 0.769474 0.866316 0.929474 0.964211 0.981053 0.988421 0.996842 0.997895 0.998947 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 0.998 0.992 0.982 0.941 0.885 0.764 0.637 0.439 0.228 0.144 0.076 0.042 0.016 0.001 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
