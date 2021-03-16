%% Backward euler scheme

omega = 2;
P = 2*pi/omega;
dt = P/20;
T=3*P;
N_t=floor(T/dt);
t=linspace(0, N_t*dt, N_t+1);

u=zeros(N_t+1, 1);
v=zeros(N_t+1, 1);

% Initial condition

u(1)=2;
v(1)=0;

% Step equations forward in time
for n = 2:N_t
 u(n)=(1.0/(1+(dt*omega)^2))*(dt*v(n-1) + u(n-1));
 v(n)=(1.0/(1+(dt*omega)^2))*(-dt*omega^2*u(n-1) + v(n-1));
end

plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'location', 'northwest')
xlabel('t')

