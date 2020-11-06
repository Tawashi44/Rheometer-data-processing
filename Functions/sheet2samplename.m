function sample_name = sheet2samplename(sheet_name)

sheetCount = numel(sheet_name);

for i = 1:sheetCount
    
    temp_sheet_name = sheet_name(i);
    index_CC = strfind(temp_sheet_name,"CC");
    char_sheet_name = char(temp_sheet_name);
    char_sample_name = char_sheet_name(index_CC:index_CC+4);
    str_sample_name = convertCharsToStrings(char_sample_name);
    sample_name(i) = str_sample_name;    
    
end

end