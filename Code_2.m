% a is for default, b is for Baynes tune, c is for average, d is for lower
% quartile, e is for upper quartile, f is for ATLAS
default = readmatrix("Pb_Pb_default_0.dat");
a_1 = default(:,4:4);
a_2 = default(:,5:5);
a_3 = inrange(a_1,a_2,prctile(a_1,85),prctile(a_1,90));
a_3 = a_3/mean(a_3);
a_e = errs(a_1,a_2,prctile(a_1,85),prctile(a_1,90));
[a_y,a_x] = hist(a_3,50);
a_e = a_e/trapz(a_x,a_y);
a_y = a_y/trapz(a_x,a_y);
errorbar(a_x,a_y,a_e,'DisplayName','TRENTO (default - 0 fm)');
hold on;
% default setting is plot of a_y against a_x
Baynes = readmatrix("Pb_Pb_276_Baynes_tune_1.27.dat");
b_1 = Baynes(:,4:4);
b_2 = Baynes(:,5:5);
b_3 = inrange(b_1,b_2,prctile(b_1,85),prctile(b_1,90));
b_3 = b_3/mean(b_3);
b_e = errs(b_1,b_2,prctile(b_1,85),prctile(b_1,90));
[b_y,b_x] = hist(b_3,50);
b_e = b_e/trapz(b_x,b_y);
b_y = b_y/trapz(b_x,b_y);
errorbar(b_x,b_y,b_e,'DisplayName','TRENTO (Baynes tune – 1.27 fm)');
% Baynes tune is plot of b_y against b_x
average = readmatrix("Pb_Pb_0.635.dat");
c_1 = average(:,4:4);
c_2 = average(:,5:5);
c_3 = inrange(c_1,c_2,prctile(c_1,85),prctile(c_1,90));
c_3 = c_3/mean(c_3);
c_e = errs(c_1,c_2,prctile(c_1,85),prctile(c_1,90));
[c_y,c_x] = hist(c_3,50);
c_e = c_e/trapz(c_x,c_y);
c_y = c_y/trapz(c_x,c_y);
errorbar(c_x,c_y,c_e,'DisplayName','TRENTO (0.635 fm)');
% average setting is plot of c_y against c_x
low_quart = readmatrix("Pb_Pb_0.3175.dat");
d_1 = low_quart(:,4:4);
d_2 = low_quart(:,5:5);
d_3 = inrange(d_1,d_2,prctile(d_1,85),prctile(d_1,90));
d_3 = d_3/mean(d_3);
d_e = errs(d_1,d_2,prctile(d_1,85),prctile(d_1,90));
[d_y,d_x] = hist(d_3,50);
d_e = d_e/trapz(d_x,d_y);
d_y = d_y/trapz(d_x,d_y);
errorbar(d_x,d_y,d_e,'DisplayName','TRENTO (0.3175 fm)');
% lower quartile setting is plot of d_y against d_x
upp_quart = readmatrix("Pb_Pb_0.9525.dat");
e_1 = upp_quart(:,4:4);
e_2 = upp_quart(:,5:5);
e_3 = inrange(e_1,e_2,prctile(e_1,85),prctile(e_1,90));
e_3 = e_3/mean(e_3);
e_e = errs(e_1,e_2,prctile(e_1,85),prctile(e_1,90));
[e_y,e_x] = hist(e_3,50);
e_e = e_e/trapz(e_x,e_y);
e_y = e_y/trapz(e_x,e_y);
errorbar(e_x,e_y,e_e,'DisplayName','TRENTO (0.9525 fm)');
% upper quartile setting is plot of e_y against e_x
ATLAS_10_15 = readmatrix("10 - 15_centrality");
f_x = ATLAS_10_15(:,1:1);
f_y = ATLAS_10_15(:,2:2);
f_xy = arrayfun(@(n,m) n*m, f_x, f_y);
f_x_ave = trapz(f_x,f_xy)/trapz(f_x,f_y);
f_x = f_x/f_x_ave;
f_e_1 = ATLAS_10_15(:,3:3);
f_e_2 = ATLAS_10_15(:,5:5);
f_e = arrayfun(@(n,m) sqrt(n^2+m^2), f_e_1, f_e_2);
f_e = f_e/trapz(f_x,f_y);
f_y = f_y/trapz(f_x,f_y);
errorbar(f_x,f_y,f_e,'DisplayName','ATLAS (10 to 15%)');
% ATLAS (10 to 15%) data is plot of f_y against f_x
ATLAS_0_5 = readmatrix("0 - 5_centrality");
g_x = ATLAS_0_5(:,1:1);
g_y = ATLAS_0_5(:,2:2);
g_xy = arrayfun(@(n,m) n*m, g_x, g_y);
g_x_ave = trapz(g_x,g_xy)/trapz(g_x,g_y);
g_x = g_x/g_x_ave;
g_e_1 = ATLAS_0_5(:,3:3);
g_e_2 = ATLAS_0_5(:,5:5);
g_e = arrayfun(@(n,m) sqrt(n^2+m^2), g_e_1, g_e_2);
g_e = g_e/trapz(g_x,g_y);
g_y = g_y/trapz(g_x,g_y);
errorbar(g_x,g_y,g_e,'DisplayName','ATLAS (0 to 5%)');
% ATLAS (0 to 5%) data is plot of g_y against g_x
ATLAS_5_10 = readmatrix("5 - 10_centrality");
h_x = ATLAS_5_10(:,1:1);
h_y = ATLAS_5_10(:,2:2);
h_xy = arrayfun(@(n,m) n*m, h_x, h_y);
h_x_ave = trapz(h_x,h_xy)/trapz(h_x,h_y);
h_x = h_x/h_x_ave;
h_e_1 = ATLAS_5_10(:,3:3);
h_e_2 = ATLAS_5_10(:,5:5);
h_e = arrayfun(@(n,m) sqrt(n^2+m^2), h_e_1, h_e_2);
h_e = h_e/trapz(h_x,h_y);
h_y = h_y/trapz(h_x,h_y);
errorbar(h_x,h_y,h_e,'DisplayName','ATLAS (5 to 10%)');
% ATLAS (5 to 10%) data is plot of h_y against h_x
legend;
title("Anisotropy for 10 - 15% centrality");
xlabel("normalized spatial/momentum anisotropy");
ylabel("probability density");
hold off;
% plot of anisotropy comparison
d = [0, 0.3175, 0.635, 0.9525, 1.27];
s = [0.4273, 0.4175, 0.4111, 0.3980, 0.3764];
s_e = [0.0025, 0.00285, 0.0032, 0.00265, 0.0028];
% values of sigma against d
s_exp = 0.4004;
s_exp_e = 0.0016;
d_opt_raw = interp1(s,d,s_exp);
d_opt_raw_e = (interp1(s,d,s_exp+s_exp_e) - interp1(s,d,s_exp-s_exp_e))/2;
% optimum d by interpolation on raw plot
T = table(d,s);
writetable(T, 'd_s_values');
% table of sigma against d
D_opt_raw = table(s_exp,s_exp_e,d_opt_raw,d_opt_raw_e);
writetable(D_opt_raw, 'Opt_d_raw');
% table of optimum d on raw plot
lin_x = 0:0.025:1.27;
lin_y = arrayfun(@(n) -0.0382*(n)+0.4303, lin_x);
% lin_e = arrayfun(@(n) 0.016445*(n)+0.0128, lin_x);
% errorbar(lin_x,lin_y,lin_e);
d_opt_lin = interp1(lin_y,lin_x,s_exp);
d_opt_lin_e = (interp1(lin_y,lin_x,s_exp+s_exp_e) - interp1(lin_y,lin_x,s_exp-s_exp_e))/2;
% optimum d by interpolation on linear plot
D_opt_lin = table(s_exp,s_exp_e,d_opt_lin,d_opt_lin_e);
writetable(D_opt_lin, 'Opt_d_lin');
% table of optimum d on linear plot
quad_x = 0:0.025:1.27;
quad_y = arrayfun(@(n) -0.02147*(n^2)-0.01094*(n)+0.426, quad_x);
% quad_e = arrayfun(@(n) 0.0313905*(n^2)+0.041575*(n)+0.01115, quad_x);
% errorbar(quad_x,quad_y,quad_e);
d_opt_quad = interp1(quad_y,quad_x,s_exp);
d_opt_quad_e = (interp1(quad_y,quad_x,s_exp+s_exp_e) - interp1(quad_y,quad_x,s_exp-s_exp_e))/2;
% optimum d by interpolation on quadratic plot
D_opt_quad = table(s_exp,s_exp_e,d_opt_quad,d_opt_quad_e);
writetable(D_opt_quad, 'Opt_d_quad');
% table of optimum d on quadratic plot
errorbar(d,s,s_e);
hold on;
errorbarxy(d_opt_raw,s_exp,d_opt_raw_e,d_opt_raw_e,s_exp_e,s_exp_e,{'bo-', 'b', 'b'});
plot(lin_x,lin_y);
errorbarxy(d_opt_lin,s_exp,d_opt_lin_e,d_opt_lin_e,s_exp_e,s_exp_e,{'ro-', 'r', 'r'});
plot(quad_x,quad_y);
errorbarxy(d_opt_quad,s_exp,d_opt_quad_e,d_opt_quad_e,s_exp_e,s_exp_e,{'ko-', 'k', 'k'});
legend('optimum d (no fit)','sigma vs. d (no fit)','sigma vs. d (linear fit)','optimum d (linear fit)','sigma vs. d (quadratic fit)','optimum d (quadratric fit)');
title("Sigma coefficient vs. d parameter");
xlabel("d parameter");
ylabel("sigma coefficient");
hold off;
% plot of sigma vs. d
errorbar(a_x,arrayratio(a_x,a_y,f_x,f_y),arrayratioerr(a_x,a_e,f_x,f_y),'DisplayName','default (0 fm)/ATLAS (10 to 15%)');
hold on;
errorbar(b_x,arrayratio(b_x,b_y,f_x,f_y),arrayratioerr(b_x,b_e,f_x,f_y),'DisplayName','Baynes tune (1.27 fm)/ATLAS (10 to 15%)');
errorbar(c_x,arrayratio(c_x,c_y,f_x,f_y),arrayratioerr(c_x,c_e,f_x,f_y),'DisplayName','0.635 fm/ATLAS (10 to 15%)');
errorbar(d_x,arrayratio(d_x,d_y,f_x,f_y),arrayratioerr(d_x,d_e,f_x,f_y),'DisplayName','0.3175 /ATLAS (10 to 15%)');
errorbar(e_x,arrayratio(e_x,e_y,f_x,f_y),arrayratioerr(e_x,e_e,f_x,f_y),'DisplayName','0.9525 fm/ATLAS (10 to 15%)');
yline(1,'r--','DisplayName','target ratio')
legend;
title("Ratio of spatial to momentum anisotropy – ATLAS centrality 10 to 15%");
xlabel("normalized spatial/momentum anisotropy");
ylabel("ratio");
hold off;
% plot of ratio comparison for ATLAS (10 to 15%)
errorbar(a_x,arrayratio(a_x,a_y,g_x,g_y),arrayratioerr(a_x,a_e,g_x,g_y),'DisplayName','default (0 fm)/ATLAS (0 to 5%)');
hold on;
errorbar(b_x,arrayratio(b_x,b_y,g_x,g_y),arrayratioerr(b_x,b_e,g_x,g_y),'DisplayName','Baynes tune (1.27 fm)/ATLAS (0 to 5%)');
errorbar(c_x,arrayratio(c_x,c_y,g_x,g_y),arrayratioerr(c_x,c_e,g_x,g_y),'DisplayName','0.635 fm/ATLAS (0 to 5%)');
errorbar(d_x,arrayratio(d_x,d_y,g_x,g_y),arrayratioerr(d_x,d_e,g_x,g_y),'DisplayName','0.3175 /ATLAS (0 to 5%)');
errorbar(e_x,arrayratio(e_x,e_y,g_x,g_y),arrayratioerr(e_x,e_e,g_x,g_y),'DisplayName','0.9525 fm/ATLAS (0 to 5%)');
yline(1,'r--','DisplayName','target ratio')
legend;
title("Ratio of spatial to momentum anisotropy – ATLAS centrality 0 to 5%");
xlabel("normalized spatial/momentum anisotropy");
ylabel("ratio");
hold off;
% plot of ratio comparison for ATLAS (0 to 5%)
errorbar(a_x,arrayratio(a_x,a_y,h_x,h_y),arrayratioerr(a_x,a_e,h_x,h_y),'DisplayName','default (0 fm)/ATLAS (5 to 10%)');
hold on;
errorbar(b_x,arrayratio(b_x,b_y,h_x,h_y),arrayratioerr(b_x,b_e,h_x,h_y),'DisplayName','Baynes tune (1.27 fm)/ATLAS (5 to 10%)');
errorbar(c_x,arrayratio(c_x,c_y,h_x,h_y),arrayratioerr(c_x,c_e,h_x,h_y),'DisplayName','0.635 fm/ATLAS (5 to 10%)');
errorbar(d_x,arrayratio(d_x,d_y,h_x,h_y),arrayratioerr(d_x,d_e,h_x,h_y),'DisplayName','0.3175 /ATLAS (5 to 10%)');
errorbar(e_x,arrayratio(e_x,e_y,h_x,h_y),arrayratioerr(e_x,e_e,h_x,h_y),'DisplayName','0.9525 fm/ATLAS (5 to 10%)');
yline(1,'r--','DisplayName','target ratio')
legend;
title("Ratio of spatial to momentum anisotropy – ATLAS centrality 5 to 10%");
xlabel("normalized spatial/momentum anisotropy");
ylabel("ratio");
hold off;
% plot of ratio comparison for ATLAS (5 to 10%)