function yEER = Experiment5Average_MC
x = 0:2000:60000;
xq = 0:0.5:60000;

y0 = [0 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.00263158 0.0105263 0.0434211 0.123684 0.286842 0.471053 0.626316 0.747368 0.843421 0.902632 0.940789 0.972368 0.982895 0.994737 0.994737 0.997368 0.997368 1 1 1];
yy0 = interp1(x, y0, xq, 'pchip');
y1 = [1 1 1 0.9975 0.995 0.99125 0.98125 0.94 0.865 0.73125 0.5975 0.3925 0.215 0.13125 0.06875 0.04125 0.02125 0.0075 0.005 0.005 0.00375 0.00125 0 0 0 0 0 0 0 0 0];
yy1 = interp1(x, y1, xq, 'pchip');

% Calculating EER: 
y2 = abs(y0 - y1);
find(y2 == min(y2));
yy2 = abs(yy0 - yy1);
xEER = find(yy2 == min(yy2));
yEER = yy0(xEER); % Y-axis EER
end
