function yEER = Database2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00105263 0.00210526 0.0210526 0.0736842 0.172632 0.327368 0.509474 0.643158 0.773684 0.856842 0.907368 0.938947 0.963158 0.975789 0.988421 0.991579 0.993684 0.998947 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.996 0.99 0.976 0.92 0.853 0.703 0.574 0.379 0.202 0.128 0.066 0.041 0.021 0.007 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end