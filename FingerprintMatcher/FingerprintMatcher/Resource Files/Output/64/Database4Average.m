function yEER = Database4Average
close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.0031579 0.00736842 0.0357895 0.108421 0.276842 0.455789 0.623158 0.736842 0.825263 0.895789 0.931579 0.963158 0.975789 0.988421 0.996842 0.998947 0.998947 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.997 0.995 0.993 0.986 0.956 0.896 0.77 0.631 0.408 0.215 0.139 0.065 0.034 0.015 0.006 0.004 0.004 0.003 0.001 0 0 0 0 0 0 0 0 0];
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

print(main, 'Database4AverageMain', '-dpng');
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

print(FNRxFPR, 'Database4AverageFNRxFPR','-dpng');
end
