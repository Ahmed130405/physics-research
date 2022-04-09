trentocmdString = ['cd documents/trento/data_3 && trento Pb Pb 300000 -x 7.0 -n 18.38 -k 1.19 -p 0.007 -d 0.8 -w 0.4 --b-max ' num2str(bprc(1)) ' > Pb_Pb_d0.8_w0.4_5TeV_bmax' num2str(bprc(1)) '.txt'];
trentocmd{1} = trentocmdString;
for i = 2:10
    trentocmdString = ['cd documents/trento/data_3 && trento Pb Pb 300000 -x 7.0 -n 18.38 -k 1.19 -p 0.007 -d 0.8 -w 0.4 --b-min ' num2str(bprc(i-1)) ' --b-max ' num2str(bprc(i)) ' > Pb_Pb_d0.8_w0.4_5TeV_bmin' num2str(bprc(i-1)) '_bmax' num2str(bprc(i)) '.txt'];
    trentocmd{i} = trentocmdString;
end
trentocmd = transpose(trentocmd);
writecell(trentocmd,'trentocmd_1');