clear all;
for i = 1:6
    for j = 1:5
        filenameString = ['Pb_Pb_d' num2str(0.6+i*0.1) '_w' num2str(0.2+j*0.2) '.txt'];
        data = readtable(filenameString);
        b = table2array(data(:,2:2));
        I = b < prctile(b,1);
        e2 = table2array(data(:,5:5));
        e2rms = rms(e2(I));
        e3 = table2array(data(:,6:6));
        e3rms = rms(e3(I));
        z(i,j) = e3rms/e2rms;
    end
end
d = 0.7:0.1:1.2;
w = 0.4:0.2:1.2;
[D,W] = meshgrid(d,w);
figure(1), clf
contourf(transpose(D),transpose(W),z)
c = colorbar;
c.Label.String = 'e3/e2';
xlabel('d');
ylabel('w');