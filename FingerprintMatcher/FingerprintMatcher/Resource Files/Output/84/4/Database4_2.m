function yEER = Database4_2
close all;
clear;
clc;
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.00526316 0.0157895 0.0368421 0.126316 0.215789 0.394737 0.521053 0.642105 0.763158 0.826316 0.857895 0.894737 0.936842 0.947368 0.963158 0.978947 0.978947 0.994737 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.995 0.995 0.995 0.985 0.965 0.9 0.77 0.655 0.43 0.2 0.125 0.085 0.08 0.06 0.025 0.02 0.02 0.015 0.005 0 0 0 0 0 0 0 0 0];
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
end
