close all;
clear;
clc;
x = 0:2000:30000;
xq = 0:0.5:30000;

y0 = [0 0 0 0 0.00526316 0.0736842 0.405263 0.705263 0.821053 0.863158 0.921053 0.973684 1 1 1 1]
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0]
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
text(xEERIndex, yEER,strcat('    (', num2str(xEER), ', ', num2str(yEER * 100), ')'))
legend('False Aceptance', 'False Rejection', 'Location', 'SouthEast')
xlabel('Threshold')
ylabel('EERor Rate(%)')
set(gca, 'FontSize', 12)
axis([0 30000 0 1])
grid on

print(main, 'Database2_4Main', '-dpng');
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

print(FNRxFPR, 'Database2_4FNRxFPR','-dpng');