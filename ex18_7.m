for j = 1:3
    filenameString = ['atlas_cent' num2str(5*(j-1)) '-' num2str(5*j) '.csv'];
    data = readtable(filenameString);
    v2 = table2array(data(:,1:1)); v2 = v2/mean(v2);
    probv2 = table2array(data(:,2:2)); probv2 = probv2/trapz(v2,probv2);
    U{j} = v2;
    V{j} = probv2;
end
for j = 1:3
    x = U{j};
    y = V{j};
    a0 = [0 1];
    fitfun = fittype( @(a,b,x) BG(x,a,b) );
    [fitted_curve,gof] = fit(x,y,fitfun,'StartPoint',a0);
    coeffvals = coeffvalues(fitted_curve);
    atlascoeffs{j} = coeffvals;
end