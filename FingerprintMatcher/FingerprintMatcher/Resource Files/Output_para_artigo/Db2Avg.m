close all;
clear;
clc;
x = 0:2000:30000;
xq = 0:0.5:30000;

y01 = [0 0 0 0 0.00526316 0.0947368 0.431579 0.710526 0.910526 0.973684 1 1 1 1 1 1]
y02 = [0 0 0 0 0.0210526 0.0894737 0.389474 0.757895 0.884211 0.963158 0.989474 1 1 1 1 1]
y03 = [0 0 0 0 0.00526316 0.0736842 0.352632 0.647368 0.842105 0.947368 0.978947 0.994737 1 1 1 1]
y04 = [0 0 0 0 0.0105263 0.0894737 0.363158 0.663158 0.836842 0.931579 0.984211 0.994737 1 1 1 1]
y05 = [0 0 0 0 0 0.0526316 0.242105 0.536842 0.794737 0.921053 0.973684 1 1 1 1 1]

y0 = (y01 + y02 + y03 + y04 + y05)/5;

y11 = [1 0.99 0.87 0.58 0.305 0.125 0.03 0.005 0 0 0 0 0 0 0 0]
y12 = [1 0.99 0.87 0.58 0.305 0.125 0.03 0.005 0 0 0 0 0 0 0 0]
y13 = [1 0.99 0.87 0.58 0.305 0.125 0.03 0.005 0 0 0 0 0 0 0 0]
y14 = [1 0.99 0.87 0.58 0.305 0.125 0.03 0.005 0 0 0 0 0 0 0 0]
y15 = [1 0.99 0.87 0.58 0.305 0.125 0.03 0.005 0 0 0 0 0 0 0 0]

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
ylabel('Average Equal Error Rate (%)')
set(gca, 'FontSize', 12)
axis([0 30000 0 1])
grid on

print(main, 'Database1_2Main', '-dpng');
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

print(FNRxFPR, 'Database1_2FNRxFPR','-dpng');