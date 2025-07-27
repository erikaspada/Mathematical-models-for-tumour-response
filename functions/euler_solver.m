%%Explicit Euler method for f, mu, and rho
function out = euler_solver(params, u1)

Nt = params.Nt;
dt = params.dt;
beta = params.beta;
eta = params.eta;
gamma = params.gamma;
d = params.d;
rho0 = (1 / d) * (gamma - sqrt(beta * eta));

h = dt;

% f_e
f_e = zeros(Nt + 1, 1);
f_e(1) = eta;
for n = 1:Nt
    fn = 4 * sqrt(beta * f_e(n)) * (eta + u1(n) - f_e(n));
    f_e(n+1) = f_e(n) + h * fn;
end

% mu_e
mu_e = zeros(Nt + 1, 1);
mu_e(1) = 0;
for n = 1:Nt
    gn = 2 * sqrt(beta / f_e(n)) * (eta + u1(n)) * ...
        ((u1(n) / (eta + u1(n))) - mu_e(n));
    mu_e(n+1) = mu_e(n) + h * gn;
end

% rho_e
rho_e = zeros(Nt + 1, 1);
rho_e(1) = rho0;
for n = 1:Nt
    pn = (gamma - ((eta * u1(n)) / (eta + u1(n))) ...
        - (eta + u1(n)) * ((u1(n)/(eta + u1(n)) - mu_e(n)).^2) ...
        - (eta + u1(n)) * sqrt(beta / f_e(n)) ...
        - d * rho_e(n)) * rho_e(n);
    rho_e(n+1) = rho_e(n) + h * pn;
end

out.f_e = f_e;
out.mu_e = mu_e;
out.rho_e = rho_e;
end