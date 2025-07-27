%%GRAPHS
function plot_results(params, state, euler_out, time, x, u1)
%Plot drug profile
figure;
plot(params.t, u1, 'r', 'LineWidth', 2);
xlabel('Time (days)');
title('Daily administration of the drug');

%Plot mu comparison
figure;
plot(params.t, euler_out.mu_e, 'g', 'LineWidth', 2);
hold on;
plot(time, state.mu, 'm--', 'LineWidth', 2);
xlabel('Time (days)');
title('Average phenotypic state');

%Plot rho comparison
figure;
plot(params.t, euler_out.rho_e, 'g', 'LineWidth', 2);
hold on;
plot(time, state.rhot, 'm--', 'LineWidth', 2);
xlabel('Time (days)');
title('Total number of cells');

%Final population density
N = @(x) (euler_out.rho_e(end) / sqrt(2 * pi)) * ((euler_out.f_e(end) / params.beta)^(0.25)) ...
    .* exp(-0.5 * ((euler_out.f_e(end) / params.beta)^0.5) * (x - euler_out.mu_e(end)).^2);
figure;
plot(x, N(x), 'g', 'LineWidth', 2);
hold on;
plot(x, state.nt(end, :), 'm--', 'LineWidth', 2);
xlabel('Phenotypic state');
title('Final population density');

%Heatmaps
figure;
surf(x, time, state.nt);
shading flat;
view([0 90]);
title('Final population density');
xlabel('Phenotypic state');
ylabel('Time (days)');

%Compute analytical density over time
nt_e = state.n0;
for i = 1:params.Nt
    n_e = (euler_out.rho_e(i) / sqrt(2 * pi)) * ((euler_out.f_e(i) / params.beta)^0.25) ...
        .* exp(-0.5 * ((euler_out.f_e(i) / params.beta)^0.5) * (x - euler_out.mu_e(i)).^2);
    if mod(i * params.dt, 0.05) == 0
        nt_e = [nt_e; n_e];
    end
end

figure;
surf(x, time, nt_e);
shading flat;
view([0 90]);
title('Density population N');
xlabel('Phenotypic state');
ylabel('Time (days)');
end
