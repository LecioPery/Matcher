function yEER = Database1Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00210526 0.00631579 0.04 0.130526 0.281053 0.485263 0.630526 0.747368 0.833684 0.894737 0.921053 0.942105 0.961053 0.982105 0.991579 0.995789 0.998947 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.998 0.996 0.993 0.985 0.942 0.867 0.74 0.611 0.383 0.201 0.112 0.071 0.044 0.021 0.013 0.012 0.012 0.009 0.003 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end