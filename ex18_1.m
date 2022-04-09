clear all;
filenameString = ['Pb_Pb_d0.8_w0.4_5TeV.txt'];
data = readtable(filenameString);
b = table2array(data(:,2:2));
for i = 1:10
    bprc(i) = prctile(b,i);
end
bprc = transpose(bprc);