function yEER = Database4_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0105263 0.0210526 0.0526316 0.131579 0.331579 0.426316 0.631579 0.715789 0.778947 0.826316 0.873684 0.884211 0.921053 0.936842 0.963158 0.984211 0.994737 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 1 0.99 0.96 0.895 0.775 0.66 0.43 0.27 0.18 0.145 0.105 0.06 0.025 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end