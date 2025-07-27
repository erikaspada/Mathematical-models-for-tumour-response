%%Main
% Load parameters and initial conditions
[params, state] = define_parameters();

% Generate drug administration profile
u1 = drug_schedule(params, 'standard');

% Solve PDE model
[state, time, x] = PDE_solver(params, state, u1);

% Solve Euler system (f_e, mu_e, rho_e)
[euler_out] = euler_solver(params, u1);

% Plot and compare results
plot_results(params, state, euler_out, time, x, u1);
