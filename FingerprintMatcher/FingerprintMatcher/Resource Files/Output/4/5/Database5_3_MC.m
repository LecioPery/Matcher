function yEER = Database5_3_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0210526 0.0842105 0.189474 0.378947 0.563158 0.715789 0.831579 0.905263 0.942105 0.973684 0.989474 0.994737 0.994737 0.994737 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.995 0.99 0.97 0.91 0.815 0.665 0.425 0.265 0.165 0.09 0.055 0.03 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
