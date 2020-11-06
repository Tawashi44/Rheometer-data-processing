function [data, sample_name, rmseCat] = readRheoData(filename,base)

sheet_name=sheetnames(filename);

for k=1:numel(sheet_name)
    data{k}=readtable(filename,"Sheet",sheet_name(k));
end

rmseCat = erase(filename,".xlsx");
rmseCat = erase(rmseCat,"CCXXX_");
rmseCat = erase(rmseCat,base);

sample_name = sheet2samplename(sheet_name);

disp("Samples to be analysed: ")
disp(sample_name')

end