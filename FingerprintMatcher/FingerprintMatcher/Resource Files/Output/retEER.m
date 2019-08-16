function yEER = retEER(y0, y1)

    x = 0:2000:60000;
    xq = 0:0.5:60000;
    yy0 = interp1(x, y0, xq, 'pchip');    
    yy1 = interp1(x, y1, xq, 'pchip');

    y2 = abs(y0 - y1);
    find(y2 == min(y2));
    yy2 = abs(yy0 - yy1);
    xEER = find(yy2 == min(yy2));
    yEER = yy0(xEER);

return
