function yEER = Database1Average
close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0178947 0.0673684 0.151579 0.297895 0.463158 0.602105 0.730526 0.822105 0.892632 0.921053 0.950526 0.967368 0.978947 0.985263 0.993684 0.994737 0.998947 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.997 0.995 0.993 0.983 0.943 0.874 0.749 0.619 0.407 0.227 0.149 0.075 0.046 0.024 0.009 0.008 0.008 0.006 0.002 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2))
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
xEERIndex = xq(xEER) % X-axis EER
yEER = yy0(xEER) % Y-axis EER

main = figure
plot(xq, yy0,'-','LineWidth', 2);	hold on
plot(xq, yy1,'--','LineWidth', 2);	hold on
plot([xEERIndex xEERIndex], [0 yEER], 'k--');	hold on
plot([0 xEERIndex], [yEER yEER], 'k--');	hold on
plot(xEERIndex, yEER, 'bx', 'LineWidth', 10);	hold on
text(xEERIndex + 10 * xEERIndex / 100, yEER, [num2str(round((10000 * yEER)) / 100) '%'])
legend('False Aceptance', 'False Rejection', 'Location', 'SouthEast')
xlabel('Threshold')
ylabel('Error Rate (\times100%)')
title('Average Equal Error Rate')
set(gca, 'FontSize', 12)
axis([0 60000 0 1])
grid on

print(main, 'Database1AverageMain', '-dpng');
FNRxFPR = figure('Color', [1 1 1]);
plot(yy1, yy0, '-', yy1, yy0, 'LineWidth', 2);
hold on
y = -0.1:0.1:1
plot(y, y); 
set(gca, 'FontSize', 12)
xlabel('False Negative')
ylabel('False Positive')
axis([-0.1 1 -0.1 1])
set(gca, 'FontSize', 12)
grid on

print(FNRxFPR, 'Database1AverageFNRxFPR','-dpng');
end
