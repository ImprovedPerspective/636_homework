
% pattern generator
function [theta phi pattern] = pattern_generator(dtheta,dphi,func,varargin)
    
    Ntheta = 180/dtheta; Nphi = 360/dphi;
    theta = linspace(dtheta/2,180-dtheta/2,Ntheta)';
    phi = linspace(dphi/2,360-dphi/2,Nphi);
    pattern = abs(func(theta,phi,varargin));

    phi_size = size(phi);
    phi = meshExtendLeft(size(theta),phi);
    theta = meshExtendRight(theta,phi_size);
end
function mesh = meshExtendLeft(B,A)
    mesh = ones(B)*A;
end
function mesh = meshExtendRight(A,B)
    mesh = A*ones(B);
end
