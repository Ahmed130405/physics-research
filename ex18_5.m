for j = 1:3
    for i = 1:6
        matlabcmdString = ['Xcent' num2str(5*(j-1)) num2str(5*j) 'd' num2str(6+i*1) ' = X{' num2str(j) ',' num2str(i) '};'];
        matlabcmd{6*(j-1)+i} = matlabcmdString;
    end
end
for j = 1:3
    for i = 1:6
        matlabcmdString = ['Ycent' num2str(5*(j-1)) num2str(5*j) 'd' num2str(6+i*1) ' = Y{' num2str(j) ',' num2str(i) '};'];
        matlabcmd{18+6*(j-1)+i} = matlabcmdString;
    end
end
matlabcmd = transpose(matlabcmd);
writecell(matlabcmd,'matlabcmd_1');