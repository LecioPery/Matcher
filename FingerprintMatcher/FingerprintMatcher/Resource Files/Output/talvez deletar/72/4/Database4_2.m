close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.0105263 0.0315789 0.0842105 0.205263 0.315789 0.473684 0.584211 0.752632 0.810526 0.873684 0.894737 0.926316 0.942105 0.984211 0.989474 0.994737 1 1 1 1]
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.99 0.99 0.985 0.97 0.925 0.825 0.66 0.55 0.355 0.215 0.155 0.085 0.04 0.02 0.005 0 0 0 0 0 0 0 0 0 0 0 0 0]
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
ylabel('Error Rate (	imes100%)')
title('Average Equal Error Rate')
set(gca, 'FontSize', 12)
axis([0 60000 0 1])
grid on

print(main, 'Database4_2Main', '-dpng');
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

print(FNRxFPR, 'Database4_2FNRxFPR','-dpng');