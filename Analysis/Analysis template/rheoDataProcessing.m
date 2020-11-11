clc; clear; close all;    
warning off

% File directory
base = pwd;
base = [convertCharsToStrings(erase(pwd,[ filesep 'Analysis' filesep 'Analysis template'])) + filesep + 'Measurement files' + filesep];
exp_date = datestr(datetime('today'),'yyyy_mm_dd');
file_name = "Demo_CCXXX_Thickness.xlsx";

% Specify cutoff frequency
cutoffFreq = 1;

% Category of analysis for RMSE
% rmseCat = "Aging";

% Read raw data from spreadsheet
[data, sample_name, rmseCat] = readRheoData(base + file_name,base);

% Calculate frequency-averaged viscoelasticity
freqAveraged = freqAvgViscoelastic(data,sample_name,cutoffFreq);
 
% Plot default plots
defaultPlot(data,sample_name,freqAveraged,cutoffFreq)

% RMSE analysis of viscoelastic data
freqAveragedRmse = rmseSpread(freqAveraged,sample_name,rmseCat);

% Saving all figures as .png and .fig
saveAllFigures

% Saving frequency-averaged viscoelastic data as .xlsx
freqAveraged_FileName = exp_date + "_" + rmseCat + ".xlsx";
writetable(freqAveraged,freqAveraged_FileName,'Sheet','Viscoelastic')
writetable(freqAveragedRmse,freqAveraged_FileName,'Sheet','RMSE spread')


