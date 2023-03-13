%% Start the main pipeline
% v = VideoReader('motion_corrected.avi');
% numFrames = v.NumFrames;
% for i = 1:numFrames
%     I = read(v,i);
%     imshow(I)
%     pause(0.5)
% end
fileFolder = 'corrected.tif';

first_image = imread(fileFolder);
[W,H] = size(first_image);
D = numel(fileFolder);
M = zeros(W,H,D);
M(:,:,1) = first_image;
for i = 2:D
    M(:,:,i) = imread(fileFolder,i);
    % uncomment next line for seeing the reading progress
    % disp(string(i*100.0/D) + "%");
end
disp(size(M))
config =[];
config = get_defaults(config);

config.avg_cell_radius=200;
config.num_partitions_x=1;
config.num_partitions_y=1;

% change these as needed
config.cellfind_min_snr = 0;
config.thresholds.T_min_snr=1;

%M = 'm123.3_d211129_s03_magnetFront_test_2p_00001.tif';


% Add more partitions as needed for the RAM memory. As a rule of thumb, you want to partition the movie such that partitioned movie memory is 1/4th of RAM memory.
config.num_partitions_x=2;
config.num_partitions_y=2;

config.max_iter=0;

% If you sorted, make sure that S_in is the sorted cell filters coming from cell check above!


output=extractor(M,config);
save('extrat_full_sorted.mat','output','-v7.3');



