clear all;
% ex18_4
for j = 1:3
    for i = 1:6
        filenameString = ['Pb_Pb_d' num2str(0.6+i*0.1) '_w0.4.txt'];
        data = readtable(filenameString);
        b = table2array(data(:,2:2));
        if j == 1
            I = b < prctile(b,5*j);
        else
            I = b > prctile(b,5*(j-1)) & b < prctile(b,5*j);
        end
        e2 = table2array(data(:,5:5)); e2 = e2(I); e2 = e2/mean(e2);
        figure(6*(j-1)+i), clf
        h = histogram(e2,50,'Normalization','pdf');
        xlabel('e2norm');
        titleString = ['trento cent' num2str(5*(j-1)) '-' num2str(5*j) ' d' num2str(0.6+i*0.1)];
        title(titleString);
        Y{j,i} = h.Values;
        binEdges = h.BinEdges;
        X{j,i} = binEdges(1:end-1) + h.BinWidth/2;
    end
end
% ex18_6
for j = 1:3
    for i = 1:6
        x = transpose(X{j,i});
        y = transpose(Y{j,i});
        a0 = [0 1];
        fitfun = fittype( @(a,b,x) BG(x,a,b) );
        [fitted_curve,gof] = fit(x,y,fitfun,'StartPoint',a0);
        coeffvals = coeffvalues(fitted_curve);
        trentocoeffs{j,i} = coeffvals;
    end
end
% ex18_7
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
% ex18_8
for j = 1:3
    d = 0.7:0.1:1.2;
    for i = 1:6
        trentosigmavals(i) = trentocoeffs{j,i}(2);
    end
    atlassigmaval = atlascoeffs{j}(2);
    figure(18+j), clf
    scatter(d, trentosigmavals)
    hold on;
    p = polyfit(d,trentosigmavals,1);
    plot(d,polyval(p,d));
    xlabel('d');
    ylabel('sigma');
    titleString = ['cent' num2str(5*(j-1)) '-' num2str(5*j)];
    title(titleString);
    atlasdvals(j) = (atlassigmaval - p(2))/p(1); % extrapolate
end
atlasdvals = transpose(atlasdvals);
cent = 5:5:15; cent = transpose(cent);
T = table(cent,atlasdvals);
T.Properties.VariableNames = {'cent' 'atlasdvals'};
writetable(T,'atlasdvals_1');
for i = 1:18
    figurenameString = ['-f' num2str(i)];
    print(figurenameString,'-dpng');
end