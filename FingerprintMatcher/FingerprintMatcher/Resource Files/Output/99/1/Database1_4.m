function yEER = Database1_4
close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0 0 0 0 0 0 0 0 0 0 0 0.0263158 0.126316 0.247368 0.373684 0.484211 0.631579 0.778947 0.847368 0.926316 0.942105 0.978947 0.994737 0.994737 1 1 1 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 1 1 0.995 0.985 0.92 0.845 0.705 0.635 0.415 0.215 0.13 0.085 0.06 0.035 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0];
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

print(main, 'Database1_4Main', '-dpng');
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

print(FNRxFPR, 'Database1_4FNRxFPR','-dpng');
end
