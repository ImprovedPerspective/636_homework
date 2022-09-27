close all; clear all
%%
dtheta = .1; dphi = .1; % step size in theta and phi

% Compute some other values
dtheta_rad = dtheta*pi/180
dphi_rad = dphi*pi/180
Ntheta = 180/dtheta; Nphi = 360/dphi;
Npts = Ntheta*Nphi;

% Create the Pattern Array
Pattern = zeros(Npts,3);
% The first column of the matrix pattern contains the magnitude of E at each measurement point, theta and phi
% The second column contains the theta coordinate of each point
% The third clumn contains the phi coordinate of each point 

% Compute dtheta and dphi in radians for 1 degree steps 
Integral = 0;
Emax = 0; % Initial  our value of maximum E field to zero
Npt_calc = 0; % initialize the number of points computed 
% Compute and store the pattern over a sphere 

for phi_counter = 1:Nphi
	phi = phi_counter*dphi - dphi/2;
	for theta_counter = 1:Ntheta
		theta = theta_counter*dtheta - dtheta/2; % theta in degrees
		Npt_calc = Npt_calc+1;

		E = Efield(theta,phi);
		% Store the pattern value
		Pattern(Npt_calc,1) = abs(E);
		Pattern(Npt_calc,2) = theta;
		Pattern(Npt_calc,3) = phi;
		if abs(E) > Emax
			Emax = abs(E);
		end

		% Calculate the contribution to the integral for solid 
		dOmega = sin(theta*pi/180.)*dtheta_rad*dphi_rad;
		Integral = Integral + abs(E)*abs(E)*dOmega;
	end
end
% Account for unnormalized pattern;
SolidAngle = Integral/Emax/Emax;
% Compute directivitty D0 = 4*pi/Solid Angle
Do = 4*pi/SolidAngle

%plot the directivity
figure(1)
patternCustom(Pattern(:,1),Pattern(:,2),Pattern(:,3));

function E = Efield(theta,phi)

	E = sin(theta*pi/180);
end


