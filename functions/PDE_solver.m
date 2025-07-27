%%PDE

function [state, time, x] = PDE_solver(params, state, u1)
% Store data
pic = 0.05; % time step b/w saving data
rho = state.rho0;
n = state.n0;
nt = n;
rhot = rho;
time = 0;

x = params.x;
beta = params.beta;
d = params.d;
p = params.p;
k = params.k;
dx = params.dx;
dt = params.dt;
Nx = params.Nx;
Nt = params.Nt;

for i = 1:Nt
    R = (p - u1(i) .* k - d * rho);
    diff = (n(3:Nx) + n(1:Nx-2) - 2 * n(2:Nx-1)) / dx^2;
    n(2:Nx-1) = n(2:Nx-1) + dt * (R(2:Nx-1) .* n(2:Nx-1) + beta * diff);
    % Boundary conditions
    n(1) = n(2);
    n(Nx) = n(Nx-1);
    % Update rho
    rho = sum(n) * dx;
    % Save data
    if mod(i*dt, pic) == 0
        nt = [nt; n];
        rhot = [rhot rho];
        time = [time i*dt];
    end
end

mu = (x * nt' * dx) ./ rhot;

state.nt = nt;
state.rhot = rhot;
state.mu = mu;
