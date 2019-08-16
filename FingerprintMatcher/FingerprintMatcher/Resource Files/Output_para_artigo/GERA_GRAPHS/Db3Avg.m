close all;
clear;
clc;
x = 0:2000:30000;
xq = 0:0.5:30000;

y01 = [0 0 0 0 0.00526316 0.115789 0.405263 0.636842 0.805263 0.947368 0.984211 0.994737 1 1 1 1]
y02 = [0 0 0 0 0 0.136842 0.363158 0.621053 0.794737 0.915789 0.973684 0.994737 1 1 1 1]
y03 = [0 0 0 0 0 0.0684211 0.268421 0.573684 0.763158 0.915789 0.984211 0.994737 1 1 1 1]
y04 = [0 0 0 0 0 0.0736842 0.294737 0.563158 0.742105 0.889474 0.952632 0.989474 0.994737 1 1 1]
y05 = [0 0 0 0 0.00526316 0.0842105 0.278947 0.526316 0.736842 0.889474 0.952632 0.989474 1 1 1 1]

y0 = (y01 + y02 + y03 + y04 + y05)/5;

y11 = [1 0.995 0.855 0.51 0.24 0.095 0.045 0.01 0 0 0 0 0 0 0 0]
y12 = [1 0.995 0.855 0.51 0.24 0.095 0.045 0.01 0 0 0 0 0 0 0 0]
y13 = [1 0.995 0.855 0.51 0.24 0.095 0.045 0.01 0 0 0 0 0 0 0 0]
y14 = [1 0.995 0.855 0.51 0.24 0.095 0.045 0.01 0 0 0 0 0 0 0 0]
y15 = [1 0.995 0.855 0.51 0.24 0.095 0.045 0.01 0 0 0 0 0 0 0 0]

y1 = (y11 + y12 + y13 + y14 + y15)/5;

yy0 = interp1(x, y0, xq, 'pchip');
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
%plot(xEERIndex, yEER, 'bx', 'LineWidth', 10);	hold on
% text(xEERIndex, yEER,strcat('    (', num2str(xEER), ', ', num2str(yEER * 100), ')'))
text(xEERIndex+10*xEERIndex/100, yEER, [num2str(round((10000*yEER))/100) '%'])
legend('False Aceptance', 'False Rejection', 'Location', 'SouthEast')
xlabel('Threshold')
% ylabel('Average Equal Error Rate (%)')
ylabel('Error Rate (\times100%)')
set(gca, 'FontSize', 12)
axis([0 30000 0 1])
title('Average Equal Error Rate');
grid on

print(main, 'Database1_3Main', '-dpng');
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

print(FNRxFPR, 'Database1_3FNRxFPR','-dpng');