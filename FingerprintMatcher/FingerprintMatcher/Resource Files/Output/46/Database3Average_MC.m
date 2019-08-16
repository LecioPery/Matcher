function yEER = Database3Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00315789 0.00421053 0.0115789 0.0610526 0.157895 0.328421 0.517895 0.654737 0.785263 0.871579 0.917895 0.949474 0.971579 0.984211 0.99579 0.997895 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.997 0.995 0.992 0.984 0.947 0.876 0.738 0.587 0.371 0.202 0.118 0.072 0.044 0.019 0.002 0 0 0 0 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end