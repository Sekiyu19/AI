F = @(x)(x(1)^2+x(2)^2);
options = gaoptimset('Generations',20,'PopulationSize',20,'PlotFcns',@gaplotbestf);
lb = [-20, -20];
up = [20, 20];
x = ga(F,2,[],[],[],[],lb,up,[],options)