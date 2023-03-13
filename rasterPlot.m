T = load('extrat_full_sorted.mat');
T = T.output.temporal_weights;
%imshow(T);

% Create the raster plot
imagesc(T);
xlabel('Time (frames)');
ylabel('Neuron');
