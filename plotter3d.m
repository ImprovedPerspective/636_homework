close all;
%%
clf(1)
% 3d plotter
dtheta = .5; dphi = .5; % step size in theta and phi

N = 10
d = .35
beta = 2*pi*d
% beta = 2*pi*d End fire
% 2*pi*d+2.94/N Hansen woodard
[theta phi pattern] = pattern_generator(dtheta,dphi,@uniformarraypattern,N,d,beta);
% pattern = abs(pattern).^2/max(max(abs(pattern))).^2;
D0 = directivity(theta,phi,pattern,dtheta,dphi)

figure(1);
patternCustom(pattern(:),theta(:),phi(:));
figure(2)
polarplot(deg2rad(theta(:,1)),pattern(:,1))


function E = Efield(theta,phi,varargin)
 E = sin(theta*pi/180)*ones(size(phi));
end

% Extend matrix A to be multiplied by the size contained in B
% Used when both created from linspace
function mesh = meshExtendLeft(B,A)
    mesh = ones(B)*A;
end
function mesh = meshExtendRight(A,B)
    mesh = A*ones(B);
end
