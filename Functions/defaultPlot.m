function [] = defaultPlot(sheet_data,sample_name,freqAveragedViscoelastic,cutoffFreq)

%set(0,'DefaultFigureWindowStyle','docked')
mkdir('figures');

% Prepare plot colors
load ../../Functions/color.mat
for i=1:length(c)
    str = c{i};
    c2{i} = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255; % Convert to RGB for old versions
end
c = c2;

%% G' G'' Loss tangent for individual samples

for i = 1:numel(sheet_data)
    temp_sheet_data = sheet_data{i};
    
    figure; hold on; grid minor
    
    %ylim([0 200])
    set(gca, 'XScale', 'log')
    set(gca, 'YScale', 'log')
    
    h(1) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa,"Color",c{1});
    h(2) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa_1,"Color",c{2});
    h(3) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa_1./temp_sheet_data.G_InPa,"Color",c{3});

    xlabel("Frequency [Hz]",'fontsize',10)
    ylabel("Shear modulus [Pa]",'fontsize',10)
    
    yyaxis right
    h(4) = plot(temp_sheet_data.fInHz,temp_sheet_data.x____InPas,"Color",c{4});
    ylabel("Magnitude of complex viscosity [Pa-s]",'fontsize',10)

    title(sample_name(i))

    legend_str  = ["Storage modulus G'","Loss modulus G''","Loss tangent tan(\delta_p)",...
        "Magnitude of complex viscosity |\eta*|"];
    l = legend(h,legend_str,'location','northeastoutside','fontsize',10);
    dim = [l.Position(1)*1.5 0.71 0 0];
    
    textbox_str = {"Frequency-averaged" "viscoelastic data",...
        "G' = " + num2str(round(freqAveragedViscoelastic.G_p(i),2) + " [Pa]"), ...
        "G'' = " + num2str(round(freqAveragedViscoelastic.G_pp(i),2) + " [Pa]"),...
        "tan(\delta_p) = " + num2str(round(freqAveragedViscoelastic.loss_tangent(i),2)),...
        "|G*| = " + num2str(round(freqAveragedViscoelastic.G_star(i),2) + " [Pa]"),...
        "|\eta*| = " + num2str(round(freqAveragedViscoelastic.eta_star(i),2) + " [Pa-s]"),...
        "Cutoff frequency = " + num2str(cutoffFreq) + " [Hz]"};
    annotation('textbox',dim,'String',textbox_str,'FitBoxToText','on','Backgroundcolor','w','fontsize',10);
    
end

%% G' for all samples
figure; hold on; grid minor

for i = 1:numel(sheet_data)
    
    temp_sheet_data = sheet_data{i};
    
    h(i) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa,"Color",c{i});
    
end

legend(h,sample_name,'location','northeastoutside');

%ylim([0 200])
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

title("Shear storage modulus G'")
xlabel("Frequency [Hz]",'fontsize',10)
ylabel("Shear modulus [Pa]",'fontsize',10)
%% G'' for all samples
figure; hold on; grid minor

for i = 1:numel(sheet_data)
    
    temp_sheet_data = sheet_data{i};
    
    h(i) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa_1,"Color",c{i});
    
end

legend(h,sample_name,'location','northeastoutside');

%ylim([0 200])
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

title("Shear loss modulus G''")
xlabel("Frequency [Hz]",'fontsize',10)
ylabel("Shear modulus [Pa]",'fontsize',10)

%% Loss tangent tan(delta) for all samples
figure; hold on; grid minor

for i = 1:numel(sheet_data)
    
    temp_sheet_data = sheet_data{i};
    
    h(i) = plot(temp_sheet_data.fInHz,temp_sheet_data.G_InPa_1./temp_sheet_data.G_InPa,"Color",c{i});
    
end

legend(h,sample_name,'location','northeastoutside');

ylim([0 200])
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

title("Loss tangent tan(\delta)")
xlabel("Frequency [Hz]",'fontsize',10)
ylabel("Loss tangent [-]",'fontsize',10)


%%
%saveAllFigures
end

