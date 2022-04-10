for j = 1:3
    for i = 1:6
        x = transpose(X{j,i});
        y = transpose(Y{j,i});
        a0 = [0 1];
        fitfun = fittype( @(a,b,x) BG(x,a,b) );
        [fitted_curve,gof] = fit(x,y,fitfun,'StartPoint',a0);
        coeffvals = coeffvalues(fitted_curve);
        coeffs{j,i} = coeffvals;
    end
end