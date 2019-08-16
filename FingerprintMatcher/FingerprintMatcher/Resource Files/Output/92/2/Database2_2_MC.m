function yEER = Database2_2_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0.0105263 0.0315789 0.105263 0.194737 0.384211 0.621053 0.715789 0.852632 0.921053 0.963158 0.989474 1 1 1 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.99 0.975 0.935 0.875 0.74 0.575 0.355 0.185 0.125 0.06 0.025 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
