clc; clear; close all;    
warning off

%% Inputs
% Measurement file to be analysed
file_name = "Demo_CCXXX_Thickness.xlsx";

% Specify cutoff frequency
cutoffFreq = 1;

%%
% File directory
base = readFileDir();

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
exp_date = datestr(datetime('today'),'yyyy_mm_dd'); % Append today's date to output .xlsx file
freqAveraged_FileName = exp_date + "_" + rmseCat + ".xlsx";
writetable(freqAveraged,freqAveraged_FileName,'Sheet','Viscoelastic')
writetable(freqAveragedRmse,freqAveraged_FileName,'Sheet','RMSE spread')


