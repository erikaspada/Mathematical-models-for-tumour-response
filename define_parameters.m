%%DEFINITION OF VARIABLES

function [params, state] = define_parameters()

% Time discretization
params.tend = 84;
params.dt = 0.001;
params.Nt = params.tend / params.dt;
params.t = 0:params.dt:params.tend;

% Space discretization
params.xmin = -0.5;
params.xmax = 1.5;
params.Nx = 1200;
params.x = linspace(params.xmin, params.xmax, params.Nx);
params.dx = abs(params.x(2) - params.x(1));

% Parameters
params.beta = 0.001;
params.gamma = 0.66;
params.eta = 0.132;
params.d = 0.66 * 10^(-8);
params.k = (1 - params.x).^2;
params.p = params.gamma - params.eta * params.x.^2;

% Initial condition
rho0 = (1 / params.d) * (params.gamma - (params.beta * params.eta)^0.5);
f0 = params.eta;
mu0 = 0;
n0 = (rho0 / sqrt(2 * pi)) * ((f0 / params.beta)^(0.25)) .* ...
exp(-0.5 * ((f0 / params.beta)^(0.5)) * (params.x - mu0).^2);

state.n0 = n0;
state.rho0 = rho0;
end


