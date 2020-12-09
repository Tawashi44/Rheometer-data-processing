function [data, samplename, rmseCat] = readRheoData(filename,base)

[status, sheetnames] = xlsfinfo(filename);
sheetnames = sort(sheetnames);

for k=1:numel(sheetnames)
    data{k}=readtable(filename,"Sheet",sheetnames{k});
end

rmseCat = erase(filename,".xlsx");
rmseCat = erase(rmseCat,"CCXXX_");
rmseCat = erase(rmseCat,base);

samplename = sheet2samplename(sheetnames);

disp("Samples to be analysed: ")
disp(samplename')

end