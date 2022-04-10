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