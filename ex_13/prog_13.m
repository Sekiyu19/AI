load fisheriris
ctree = fitctree(meas,species);
view(ctree);
view(ctree,'mode', 'graph');