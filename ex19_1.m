filenameString = ['Pb_Pb_d0.8_w0.4_5TeV.txt'];
data = readtable(filenameString);
nch = table2array(data(:,4:4));
centrality = 0.5:1:9.5;
for i = 1:10
    nchprc(i) = prctile(nch,100-i);
end
nchprc = transpose(nchprc);
for i = 1:10
    if i == 1
        I = nch > prctile(nch,100-i);
    else
        I = nch > prctile(nch,100-i) & nch < prctile(nch,100-(i-1));
    end
    e2 = table2array(data(:,5:5)); e2 = e2(I);
    e3 = table2array(data(:,6:6)); e3 = e3(I);
    e2rms(i) = rms(e2);
    e3rms(i) = rms(e3);
end
e2rms = transpose(e2rms);
e3rms = transpose(e3rms);
T = table(centrality,e2rms,e3rms);
T.Properties.VariableNames = {'centrality' 'e2(2)' 'e3(2)'};
writetable(T,'e3_e2_table_3');
U = table(centrality,nchprc);
U.Properties.VariableNames = {'centrality' 'nch'};
writetable(U,'nchprc_1');

