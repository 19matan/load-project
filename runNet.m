


imds = imageDatastore('imageByHourly_I_2009','IncludeSubfolders',true,'LabelSource','foldernames');
[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');

augimdsTrain = augmentedImageDatastore([32 32],imdsTrain);
augimdsValidation = augmentedImageDatastore([32 32],imdsValidation);

options = trainingOptions('sgdm', ...
    'MiniBatchSize',100, ...
    'MaxEpochs',20, ...
    'Shuffle','every-epoch', ...
    'InitialLearnRate',1e-4, ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',6, ...
    'Verbose',false, ...
    'Plots','training-progress');

numClasses = numel(categories(imdsTrain.Labels));
fullyConnectedLayer(numClasses)

netTransfer = trainNetwork(augimdsTrain,layers,options);

[YPred,probs] = classify(netTransfer,augimdsValidation);
accuracy = mean(YPred == imdsValidation.Labels)


idx = randperm(numel(augimdsValidation.Files),4);
figure
for i = 1:4
    subplot(2,2,i)
    I = readimage(imdsValidation,idx(i));
    imshow(I)
    label = YPred(idx(i));
    title(string(label) + ", " + num2str(100*max(probs(idx(i),:)),3) + "%");
end

img = imread("peppers.png");
img = imresize(img, [32, 32]);
label = predict(net, img);
imshow(img);
title(label);
