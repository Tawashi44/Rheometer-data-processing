clc;
clear all;
close all;
    
warning off

% File directory
base = pwd;
base = [convertCharsToStrings(erase(pwd,'\Analysis\Analysis template')) + '\Measurement files'];
exp_date = datestr(today('datetime'));

% Specify cutoff frequency
cutoffFreq = 1;

% Category of analysis for RMSE
% rmseCat = "Aging";

% Read raw data from spreadsheet
[data, sample_name,rmseCat] = readRheoData(base + "Demo_CCXXX_Thickness",base);

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


