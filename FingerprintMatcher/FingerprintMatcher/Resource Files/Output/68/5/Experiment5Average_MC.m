function yEER = Experiment5Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.0105263 0.0447368 0.146053 0.303947 0.494737 0.642105 0.759211 0.846053 0.9 0.935526 0.960526 0.973684 0.988158 0.992105 0.997368 0.998684 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.9975 0.995 0.99125 0.98125 0.94 0.865 0.73125 0.5975 0.3925 0.215 0.13125 0.06875 0.04125 0.02125 0.0075 0.005 0.005 0.00375 0.00125 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
