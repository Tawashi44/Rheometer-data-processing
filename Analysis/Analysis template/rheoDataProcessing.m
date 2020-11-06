clc;
clear all;
close all;
    
warning off

% File directory
base = "C:\Users\E3Kom\Google Drive (christopheryujuilai@alum.ccu.edu.tw)\Thesis\Experiments\Rheology tests\Rheometre analysis tool\01_Measurement files\";
exp_date = "2020.11.05_";

% Specify cutoff frequency
cutoffFreq = 1;

% Category of analysis for RMSE
% rmseCat = "Aging";

% Read raw data from spreadsheet
[data, sample_name,rmseCat] = readRheoData(base + "CCXXX_Samples.xlsx",base);

% Calculate frequency-averaged viscoelasticity
freqAveraged = freqAvgViscoelastic(data,sample_name,cutoffFreq);
 
% Plot default plots
defaultPlot(data,sample_name,freqAveraged,cutoffFreq)

% RMSE analysis of viscoelastic data
freqAveragedRmse = rmseSpread(freqAveraged,sample_name,rmseCat);

% Saving all figures as .png and .fig
%saveAllFigures

% Saving frequency-averaged viscoelastic data as .xlsx
freqAveraged_FileName = exp_date + rmseCat + ".xlsx";
writetable(freqAveraged,freqAveraged_FileName,'Sheet','Viscoelastic')
writetable(freqAveragedRmse,freqAveraged_FileName,'Sheet','RMSE spread')


