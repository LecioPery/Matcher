function yEER = Database4Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00631579 0.00631579 0.0115789 0.0484211 0.12 0.262105 0.412632 0.566316 0.695789 0.783158 0.849474 0.902105 0.933684 0.956842 0.971579 0.987368 0.991579 0.996842 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.993 0.99 0.98 0.945 0.874 0.759 0.651 0.443 0.241 0.148 0.088 0.053 0.03 0.016 0.012 0.012 0.009 0.003 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end