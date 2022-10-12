function arrayFactor = arraypattern(theta,phi,varargin)

    n = varargin{1}{1};
    d = varargin{1}{2};
    beta = varargin{1}{3};
    coef = varargin{1}{4};
    k = 2*pi;
    psi = k*d*cos(deg2rad(theta))+beta;
    ze = exp(1i*psi);
    s = polyval(coef,ze); 
    arrayFactor = s*ones(size(phi));
end



