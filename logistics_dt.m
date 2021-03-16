%% Jussi Leppänen 0555749 logistic_dt.m

clc

f = @(u, t) 0.1*(1-u/500)*u
U_0=100;

dt=0.5; 
T=50;

[u, t]=ode_FE(f, U_0, dt, T);

k=1;
loop=true;
while loop==true
    dt_k=2^(-k)*dt;
    [u_1, t_1]=ode_FE(f, U_0, dt_k, T);
    plot(t, u, 'b-', t_1, u_1, 'r--');
    xlabel ('t');
    ylabel ('N(t)');
    dt_k
    q=input('Another iteration?', 's') %Question, user defines continuation
    if strcmp(q, 'y');
        u=u_1;
        t=t_1;
    else
        loop=false
        clc
    end
    k=k+1;
    
end

    
    
