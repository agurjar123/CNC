% motion correction
filename = 'm123.3_d211129_s03_magnetFront_test_2p_00001.tif';

% frame grouping

% play video
info = imfinfo(filename);
numframe = length(info);
for K = 1 : numframe
    rawframes(:,:,:,K) = imread(filename, K);
end
cookedframes = mat2gray(rawframes);
implay(cookedframes)