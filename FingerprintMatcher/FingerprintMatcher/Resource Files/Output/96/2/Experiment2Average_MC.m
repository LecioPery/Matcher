function yEER = Experiment2Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.00131579 0.0105263 0.0631579 0.153947 0.307895 0.51579 0.675 0.798684 0.875 0.931579 0.955263 0.981579 0.985526 0.993421 0.998684 0.998684 0.998684 1 1 1];
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
