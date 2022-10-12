function psi_plot(nulls_z,visible_region)
    circle(0,0,1)
    hold on
    scatter(real(nulls_z),imag(nulls_z))
    arc(0,0,1.1,visible_region)
    hold off
    legend("Unit Circle","Zeros","Visible Region")
    title("Psi Plot")
end
function circle(xc,yc,r)
    angle = linspace(0,2*pi,1000)
    x = r*cos(angle)
    y = r*sin(angle)
    plot(xc+x,y+yc)
end
function arc(xc,yc,r,ang)
    angle = linspace(ang(1),ang(2),1000)
    x = r*cos(angle)
    y = r*sin(angle)
    plot(xc+x,y+yc)
end