%%Generate drug administration profile
function u1 = drug_schedule(params, mode)

% Calcolo LDalpha
%u_10 = 0.1124; % LD10
%u_20 = 0.7311; % LD20
%u_25 = 2.2595; % LD25
u_30 = 5.7943; % LD30
%u_80 = 158.5966; % LD80


switch mode
case 'standard'
% distribution 4 days of administration and three days of break
u2 = zeros(1, params.Nt + 1);
counter = 0;
tau = [0 4000 7000 11000 14000 18000 21000 25000 28000 32000 35000 ...
39000 42000 46000 49000 53000 56000 60000 63000 67000 ...
70000 74000 77000 81000 84000];
for n = 1:24
if mod(counter, 2) == 0
u2(tau(n)+1 : tau(n+1)+1) = u_30;
end
counter = counter + 1;
end
u1 = u2;
end
end
