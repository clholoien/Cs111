function outvar = RK2FallObj_()
    format long
    t=0;
    tfinal=15;
    u=0;
    exact=0;
    dt=.075;
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
        
        u=u+.5*dt*( rhs(g,cd,m,u) + rhs(g,cd,m,u+dt*rhs(g,cd,m,u)) );
        t=t+dt;
        exact=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
        if(abs(u-exact)>error)
            error=abs(u-exact);
        end
        exactplot = [exactplot exact]; 
        uplot = [uplot u];
        tplot = [tplot t];
    end
    %plot(tplot,exactplot,'blue');
    %plot(tplot,uplot,'.');
    plot(tplot,uplot,tplot,exactplot);
    xlabel('time');
    ylabel('position');
    error=max(abs(uplot-exactplot))

    
  