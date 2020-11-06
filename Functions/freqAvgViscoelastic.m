function [freqAvgViscoelastic] = freqAvgViscoelastic(sheetData,sample_name,cutoffFreq)

Sample = sample_name';

% Find index for cutoff frequncy
temp_cutoffFreq = sheetData{1}.fInHz;
cutoffIndex = find(temp_cutoffFreq == cutoffFreq);


% Averaged shear storage, loss modulus and loss tangent
for i = 1:numel(sheetData)
   
    temp_data = sheetData{i};
    cutoffIndex_temp = cutoffIndex;
    if height(temp_data) < cutoffIndex
        cutoffIndex = height(temp_data);
    end
    G_p(i)         = mean(temp_data.G_InPa(1:cutoffIndex));
    G_pp(i)        = mean(temp_data.G_InPa_1(1:cutoffIndex));
    G_star(i)      = mean(temp_data.x_G__InPa(1:cutoffIndex));
    eta_p(i)       = mean(temp_data.x__InPas(1:cutoffIndex));
    eta_pp(i)      = mean(temp_data.x___InPas(1:cutoffIndex));
    eta_star(i)    = mean(temp_data.x____InPas(1:cutoffIndex));
    J_p(i)         = mean(temp_data.J_In1_Pa(1:cutoffIndex));
    J_pp(i)        = mean(temp_data.J_In1_Pa_1(1:cutoffIndex));
    J_star(i)      = mean(temp_data.x_J__In1_Pa(1:cutoffIndex));
    delta_p(i)     = mean(temp_data.x_In_(1:cutoffIndex));
    loss_tangent(i)= mean(temp_data.tan___In_(1:cutoffIndex));
    gamma(i)       = mean(temp_data.x_In__1(1:cutoffIndex));
    tau(i)         = mean(temp_data.x_InPa(1:cutoffIndex));
    delta_s(i)     = mean(temp_data.hInMm(1:cutoffIndex));
    temper(i)      = mean(temp_data.TIn_C(1:cutoffIndex));
    temper_motor(i)= mean(temp_data.T_MotorIn_C(1:cutoffIndex));

    
   % 2020.11.05: New raw data has G in Pa instead of MPa; changed .
   % directory
    cutoffIndex = cutoffIndex_temp;
end

% 2020.11.05: Comment out below 3 rows 
% G_inKPa = G'.*1e3;
% GG_inKPa = GG'.*1e3;
% lossTangent = GG_inKPa./G_inKPa;

G_p  = G_p';
G_pp = G_pp';
G_star = G_star';
eta_p = eta_p';
eta_pp = eta_pp';
eta_star = eta_star';
J_p = J_p';
J_pp = J_pp';
J_star = J_star';
delta_p = delta_p';
loss_tangent = loss_tangent';
gamma = gamma';
tau = tau';
delta_s = delta_s';
temper = temper';
temper_motor = temper_motor';

freqAvgViscoelastic = table(Sample,G_p,G_pp,G_star,eta_p,eta_pp,eta_star,...
    J_p,J_pp,J_star,delta_p,loss_tangent,gamma,tau,delta_s,temper,temper_motor);


end