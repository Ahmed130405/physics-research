for i = 1:6
    for j = 1:5
        trentocmdString = ['cd documents/trento/data_2 && trento Pb Pb 300000 -x 6.4 -n 13.94 -k 1.19 -p 0.007 -d ' num2str(0.6+i*0.1) ' -w ' num2str(0.2+j*0.2) ' --b-max 1.7427 > Pb_Pb_d' num2str(0.6+i*0.1) '_w' num2str(0.2+j*0.2) '_bmax1.7427.txt'];
        disp(trentocmdString);
    end
end
