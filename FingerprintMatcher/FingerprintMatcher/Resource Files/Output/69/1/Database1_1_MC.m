function yEER = Database1_1_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0105263 0.0894737 0.205263 0.326316 0.457895 0.589474 0.715789 0.821053 0.910526 0.942105 0.952632 0.984211 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.985 0.98 0.965 0.92 0.83 0.66 0.52 0.29 0.125 0.05 0.03 0.03 0.025 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
