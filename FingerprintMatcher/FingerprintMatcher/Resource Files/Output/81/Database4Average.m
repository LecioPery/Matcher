function yEER = Database4Average
close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.00842105 0.0442105 0.129474 0.295789 0.52 0.690526 0.824211 0.89579 0.949474 0.974737 0.992632 0.996842 0.996842 0.998947 0.998947 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.999 0.995 0.991 0.978 0.932 0.86 0.728 0.599 0.403 0.204 0.122 0.063 0.038 0.017 0.002 0 0 0 0 0 0 0 0 0 0 0 0 0];
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