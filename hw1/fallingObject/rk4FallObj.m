function outvar = rk2FallObj()
    t=0;
    tfinal=15;
    u=0;
    exact=0;
    dt=.3;
    g=9.81;
    cd=.25;
    m=75;
    uplot=u;
    tplot=t;
    exactplot=exact;
    error=0;
    while(t<tfinal)
        if(t+dt>tfinal)
            dt=tfinal-t;
        end
        u=u+dt*(g-cd/m*u*u)+dt*dt/2*(-cd/m)*(2*u*(g-cd/m*u*u))+dt*dt*dt/6*(-2*cd/m*((g-cd/m*u*u)+u*(-cd/m*2*u)))+dt*dt*dt*dt/24*(-2*cd/m*(-cd/m*u*2)+(-cd/m*4)*u);
        exact=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
        if(abs(u-exact)>error)
            error=abs(u-exact);
        end
        t=t+dt;
        exactplot = [exactplot exact]; 
        uplot = [uplot u];
        tplot = [tplot t];
    end
    %plot(tplot,exactplot,'blue');
    %plot(tplot,uplot,'.');
    plot(tplot,uplot,tplot,exactplot);
    xlabel('time');
    ylabel('position');
