function sample_name = sheet2samplename(sheet_name)

sheetCount = numel(sheet_name);

for i = 1:sheetCount    
    sample_name(i) = erase(sheet_name(i),"_rwd");
end

end