function nulls_psi = coef_to_psi_nulls(coef)
    r = roots(coef);
    nulls_psi = log(r)/(1i);

end