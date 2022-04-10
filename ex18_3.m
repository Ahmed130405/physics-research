clear all;
% ex18_1
filenameString = ['Pb_Pb_d0.8_w0.4_5TeV.txt'];
data = readtable(filenameString);
b = table2array(data(:,2:2));
for i = 1:10
    bprc(i) = prctile(b,i);
end
bprc = transpose(bprc);
% ex18_3
filenameString = ['Pb_Pb_d0.8_w0.4_5TeV_bmax' num2str(bprc(1)) '.txt'];
data = readtable(filenameString);
e2 = table2array(data(:,5:5));
e2rms = rms(e2);
e3 = table2array(data(:,6:6));
e3rms = rms(e3);
z(1) = e3rms/e2rms;
for i = 2:10
    filenameString = ['Pb_Pb_d0.8_w0.4_5TeV_bmin' num2str(bprc(i-1)) '_bmax' num2str(bprc(i)) '.txt'];
    data = readtable(filenameString);
    e2 = table2array(data(:,5:5));
    e2rms = rms(e2);
    e3 = table2array(data(:,6:6));
    e3rms = rms(e3);
    z(i) = e3rms/e2rms;
end
z = transpose(z);
T = table(bprc,z);
T.Properties.VariableNames = {'b' 'e3(2)/e2(2)'};
writetable(T,'e3_e2_table_2');
scatter(bprc,z)
xlabel('b');
ylabel('e3(2)/e2(2)');