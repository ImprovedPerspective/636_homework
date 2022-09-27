function arrayFactor = uniformarraypattern(theta,phi,varargin)
% Linear array along z? so phi
%     varargin
    n = varargin{1}{1};
    d = varargin{1}{2};
    beta = varargin{1}{3};
    k = 2*pi;
    psi = k*d*cos(deg2rad(theta))+beta;
    arrayFactor = (1/n*sin(psi*n/2)./sin(psi/2))*ones(size(phi));
end

% N = 5
% d = 1.75/2
% phi = linspace(0,pi,1000);
% beta = .4*pi;
% af = uniform_arraypattern_direct(d,beta,N,phi);
% 
% polarplot(phi,af.^2)
% hold on
% polarplot(-phi,af.^2)
% hold off
% % hold on
% % plot(psi, (AF).^2/max(AF)^2)
% % hold off

