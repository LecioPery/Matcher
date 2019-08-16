function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0.00105263 0.00105263 0.0210526 0.0715789 0.156842 0.278947 0.449474 0.611579 0.745263 0.834737 0.893684 0.926316 0.954737 0.969474 0.985263 0.992632 0.994737 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.999 0.996 0.991 0.953 0.888 0.776 0.654 0.444 0.25 0.143 0.068 0.036 0.018 0.007 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
