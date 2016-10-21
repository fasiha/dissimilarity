function dissim()

pplaus = linspace(0, 1, 21);
plie = linspace(0, 1, 11);
plie =  [0, .1, .25, .5, .9, 1];

figure;
plotter(1, pplaus, plie, 131);
plotter(.75, pplaus, plie, 132);
plotter(.5, pplaus, plie, 133);

end


function phand = plotter(puseful, pplaus, plie, subi)
mkp = @(pu, pp, pl) (pu .* pp) ./ (pu .* pp + pl .* (1-pp));

[pp pl] = meshgrid(pplaus, plie);
colors = flipud(parula(length(plie)));

subplot(subi)
phand = plot(pplaus, mkp(puseful, pp, pl), 'linewidth', 3);
legend(arrayfun(@(p) sprintf('pLie=%g',p), plie,'un',0), 'location','best')
title(sprintf('pUseful = p(H said | H true) = %g', puseful))
for i=1:length(phand)
  set(phand(i), 'color', colors(i,:));
end

grid

xlabel('pPlaus = p(H true)')
ylabel('p(H true | H said)')

end
