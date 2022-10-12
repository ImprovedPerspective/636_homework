% Calculate the 
function Z = mutual_impedance(diameter,l1,l2,spacing,lambda)
    n = 1000000
    x = linspace(-l2/2,l2/2,n);
    dl = l2/n;
    eta = 120*pi
    k = 2*pi/lambda
    R1 = sqrt(spacing^2+(l1/2-x).^2);
    R2 = sqrt(spacing^2+(-l1/2-x).^2);
    r = sqrt(spacing^2+(x).^2);
    Z = 1i*eta/(4*pi*sin(k*l1/2)*sin(k*l2/2))*sum(sin(k*(l2/2-abs(x))).*(exp(-1i*k*R1)./R1+exp(-1i*k*R2)./R2-2*cos(k*l1/2)*exp(-1i*k*r)./r)*dl);
%     Zsin = 1i*eta/(sin(k*l1/2)*sin(k*l2/2))*sum(sin(k*(l2/2-abs(x))).*(exp(-1i*k*R1)./R1+exp(-1i*k*R2)./R2-2*cos(k*l1/2)*exp(-1i*k*r)./r)*dl)

end
