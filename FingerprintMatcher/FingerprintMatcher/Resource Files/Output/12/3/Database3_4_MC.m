function yEER = Database3_4_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.0105263 0.0105263 0.0368421 0.126316 0.352632 0.542105 0.684211 0.805263 0.884211 0.905263 0.905263 0.926316 0.942105 0.973684 0.984211 0.989474 0.994737 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.995 0.995 0.96 0.905 0.79 0.69 0.48 0.24 0.15 0.045 0.025 0.02 0.02 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end