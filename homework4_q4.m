
%% Calculating all D0's for d and Beta's
d = [.5 .4 .1]
N = 10
size_d = size(d,2)
size_beta = 1000;
beta = zeros(size_d,size_beta)
for i = 1:size_d
    beta(i,:) = linspace(0,2*pi*d(i)+2*pi/N,1000)
end
D0 = zeros(size_d,size_beta);
dtheta = .5; dphi = .5; % step size in theta and phi

for  i = 1:size_d
    for j = 1:size_beta
        [theta phi pattern] = pattern_generator(dtheta,dphi,@uniformarraypattern,N,d(i),beta(i,j));
        D0(i,j) = directivity(theta,phi,pattern,dtheta,dphi);
    end 
end
%% Plot D0 vs Beta for all d's
figure(1)

for  i = 1:size_d
    subplot(size_d,1,i)
    
    scatter(beta(i,:),D0(i,:))
    grid on
    title("Directivity vs Phase Shift ($$\beta$$) for d = "+d(i)+"$$\lambda$$",'interpreter','latex')
    xlabel("$$\beta$$",'interpreter','latex')
    ylabel("Directivity D0")
end

%%
N = 10;
d = [.5 .4 .1]
beta = [0*d' 2*pi*d' (2*pi*d'+pi/N)]
size_beta = 3;
D0_formula = [broadside(d,N)' ordinary_endfire(d,N)'  hansenwoodyard(d,N)']
D0_numericalAprox = zeros(size_d,size_beta);
dtheta = .5; dphi = .5; % step size in theta and phi

for  i = 1:size_d
    for j = 1:size_beta
        [theta phi pattern] = pattern_generator(dtheta,dphi,@uniformarraypattern,N,d(i),beta(i,j));
        D0_numericalAprox(i,j) = directivity(theta,phi,pattern,dtheta,dphi);
    end 
end
D0_numericalAprox

function D0 = hansenwoodyard(d,n)
    D0 = 7.28*n*d;
end
function D0 = ordinary_endfire(d,n)
    D0 = 4*n*d;
end
function D0 = broadside(d,n)
    D0 = zeros(size(d))
    for i = 1:size(d,2)
        m = 1:n-1;
        denom = 1+1./(n*pi*d(i)).*sum((n-m)./m.*sin(m*2*pi*d(i)));
        D0(1,i) = n/denom
        i
    end
end