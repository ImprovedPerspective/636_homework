
%% 1 B
lambda = 1
diameter=.1
l1 = .5
l2 = .5
spacing = .01
% Such a close spacing of the same antenna results in the self impedance
mutual_impedance(diameter,l1,l2,spacing,lambda)

%% 1 C 
% Self
lambda = 1
diameter=.1
l1 = 0.4
l2 = 0.4
spacing = .01

mutual_impedance(diameter,l1,l2,spacing,lambda)

spacing = .2
mutual_impedance(diameter,l1,l2,spacing,lambda)
%% 2 
number_elements = 5
N = number_elements
d = 1/8
nulls_psi = [-pi/4 -pi/8 pi/4 pi/8]
% nulls_psi = [0]
k = 2*pi

visible_region = [-k*d k*d];
nulls_z = exp(1i*nulls_psi);
syms z
[p coef] = poly_generator(nulls_z,z);
coef = double(coef);
dtheta = .5; dphi = .5; % step size in theta and phi
[theta phi pattern] = pattern_generator(dtheta,dphi,@arraypattern,N,d,beta,coef);
polarplot(deg2rad([theta(:,1);-theta(:,1)]),[pattern(:,1);pattern(:,1)])


%%
nulls_psi2 = coef_to_psi_nulls(coef)

psi_plot(nulls_z,visible_region)


