function D0 = directivity(theta,phi,pattern,dtheta,dphi)
    dtheta_rad = dtheta*pi/180;
    dphi_rad = dphi*pi/180;
    maxP = max(pattern,[],'all');
    dOmega = sin(theta*pi/180)*dtheta_rad*dphi_rad;
    Integral = sum(abs(pattern).^2.*dOmega,'all'); % Summing over this will be the integral
    SolidAngle = Integral/maxP/maxP;
    D0 = 4*pi/SolidAngle;
    
end