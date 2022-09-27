% Problem 7
x = linspace(-5,5,1000)
b = 1
I = 8./(b*x.^2).*(sinc(x/pi*b/2)-cos(x*b/2))
plot(x,I)
halfPowerPoint = 2*b/3/sqrt(2)
hold on 
plot(x,x./x*halfPowerPoint)

hold off 
% function intersect()
% 
% end