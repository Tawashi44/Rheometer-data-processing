function saveAllFigures

% Replace / make a figure output folder
if exist('figures2','dir') == 7 
    rmdir('figures', 's');
end
mkdir figures;

% Define the list of figures
figList = handle( sort( double(findall(0, 'type', 'figure') ) ));

% Save Matlab figures as .fig file
savefig(figList, 'figures/figures', 'compact');

% Undock and save pixel images one by one
for i=1:length(figList)
    set(figList(i),'WindowStyle','normal');
    set(figList(i), 'Units', 'pixels', 'Position', [10 10 800 600]);
    saveas(figList(i), ['figures/figure_' num2str(i) '.png']);
    set(figList(i),'WindowStyle','docked');
end