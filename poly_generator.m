% Given roots generator the expanded polynomial with its coefficients
function [p coef]= poly_generator(roots,sym)
    p = expand(prod(sym-roots,'all'));
    coef = coeffs(p,'All');
end

