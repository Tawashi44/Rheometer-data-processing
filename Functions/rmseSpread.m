function [rmseViscoelastic] = rmseSpread(freqAveragedViscoelastic,sample_name,category,iter)

G_p_mean  = mean(freqAveragedViscoelastic.G_p);
G_pp_mean = mean(freqAveragedViscoelastic.G_pp);
loss_tangent_mean = mean(freqAveragedViscoelastic.loss_tangent);
G_star_mean = mean(freqAveragedViscoelastic.G_star);
eta_star_mean = mean(freqAveragedViscoelastic.eta_star);


sampleCount = numel(freqAveragedViscoelastic.G_p);

G_p_rmse = sqrt(sum((freqAveragedViscoelastic.G_p-G_p_mean).^2)/sampleCount);
G_pp_rmse = sqrt(sum((freqAveragedViscoelastic.G_pp-G_pp_mean).^2)/sampleCount);
loss_tangent_rmse = sqrt(sum((freqAveragedViscoelastic.loss_tangent-loss_tangent_mean).^2)/sampleCount);
G_star_rmse = sqrt(sum((freqAveragedViscoelastic.G_star-G_star_mean).^2)/sampleCount);
eta_star_rmse = sqrt(sum((freqAveragedViscoelastic.eta_star-eta_star_mean).^2)/sampleCount);

rmseViscoelastic = table(sample_name,category,G_p_rmse,G_pp_rmse,loss_tangent_rmse,G_star_rmse,eta_star_rmse);

end