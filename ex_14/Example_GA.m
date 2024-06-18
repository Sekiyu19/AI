F6=@(x)((0.5-((sin(sqrt((x(1)^2+x(2)^2))))^2-0.5))/(1.0+0.001*(x(1)^2+x(2)^2))^2);

f=@(x,y)(0.5-(power(sin(sqrt(power(x,2)+power(y,2))),2)-0.5)./power(1+0.001*(power(x,2)+power(y,2)),2));
subplot(1,2,1)
fmesh(f,[-20,20,-20,20])

f1=@(x)(0.5-(power(sin(sqrt(power(x,2))),2)-0.5)./power(1+0.001*(power(x,2)),2));
subplot(1,2,2)
fplot(f1,[-20,20])

options=gaoptimset('Generations',20,'PopulationSize',20, 'PlotFcns',@gaplotbestf);
lb=[-20, -20];  % lower bound of (x1,x2)
up=[20, 20];   % upper bound of (x1,x2)
x=ga(F6,2,[],[],[],[],lb,up,[],options)
