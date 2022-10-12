
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
figure(3)

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
% D0_formula = [broadside(d,N,beta(:,1))' ordinary_endfire(d,N)'  hansenwoodyard(d,N)']
D0_formula = [uniformarray_directivity_calc(d,N,beta(:,1))' uniformarray_directivity_calc(d,N,beta(:,2))' uniformarray_directivity_calc(d,N,beta(:,3))']
D0_numericalIntegration = zeros(size_d,size_beta);
dtheta = .5; dphi = .5; % step size in theta and phi

for  i = 1:size_d
    for j = 1:size_beta


        [theta phi pattern] = pattern_generator(dtheta,dphi,@uniformarraypattern,N,d(i),beta(i,j));
        D0_numericalIntegration(i,j) = directivity(theta,phi,pattern,dtheta,dphi);
    end 
end
D0_numericalIntegration

function D0 = hansenwoodyard(d,n)
    D0 = 7.28*n*d;
end
function D0 = ordinary_endfire(d,n)
    D0 = 4*n*d;
end
function D0 = uniformarray_directivity_calc(d,n,alpha)
    D0 = zeros(size(d))
    k = 2*pi
    for i = 1:size(d,2)
        m = 1:n-1;
%         delM = (alpha(i)-k*d(i))
%         delP = (alpha(i)+k*d(i))
%         normFactor = max(abs(sin(n*delM/2)/(n*sin(delM/2))).^2,abs(sin(n*delP/2)/(n*sin(delP/2))).^2)
        delM = (alpha(i)-k*d(i))
        delP = (alpha(i)+k*d(i))
        del = linspace(delM,delP,10000);
        nf= abs(sin(n*del/2)./(n*sin(del/2))).^2;
        normFactor = max(nf)
        
%         if(normFactor < 1*10^-1)
%             normFactor = 1;
%         end
        denom = 1+1./(n*pi*d(i)).*sum((n-m)./m.*sin(m*2*pi*d(i)).*cos(m*alpha(i)));
        D0(1,i) = n*normFactor/denom
        i
    end
end