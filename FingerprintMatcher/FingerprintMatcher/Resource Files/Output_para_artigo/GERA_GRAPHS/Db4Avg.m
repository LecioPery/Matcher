close all;
clear;
clc;
x = 0:2000:30000;
xq = 0:0.5:30000;

y01 = [0 0 0 0 0 0.0578947 0.347368 0.678947 0.847368 0.894737 0.942105 0.963158 0.994737 1 1 1];
y02 = [0 0 0 0 0.00526316 0.0736842 0.405263 0.705263 0.821053 0.863158 0.921053 0.973684 1 1 1 1];
y03 = [0 0 0 0 0 0.0631579 0.421053 0.710526 0.805263 0.857895 0.9 0.931579 0.978947 1 1 1];
y04 = [0 0 0 0 0 0.0947368 0.431579 0.7 0.810526 0.863158 0.889474 0.947368 0.984211 1 1 1];
y05 = [0 0 0 0 0 0.0684211 0.394737 0.684211 0.815789 0.873684 0.910526 0.957895 1 1 1 1];

y0 = (y01 + y02 + y03 + y04 + y05)/5;

y11 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0];
y12 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0];
y13 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0];
y14 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0];
y15 = [1 1 0.915 0.485 0.215 0.085 0.04 0.025 0.005 0 0 0 0 0 0 0];

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