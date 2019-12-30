function matrixImage = trytodomatrixbyT()

tmpIndexCountStart =1;
tmpIndexCountEnd = 1 ;
    load = [];
    arrayLoadByT = [2,2,2,2,1,2,4,6,8,10,10,10,10,10,10,9,7,7,7,7,5,3,3,2,2,1,1,1,1,2,4,6];
    arrayCount = zeros(1,10);
    matrixImage = zeros(32, 32);
    for m = 1: 32
        countTmp = arrayLoadByT(m);
        arrayCount(countTmp) = arrayCount(countTmp) + 1 ;
    end
    for h = 1:32
        for k = 1: arrayLoadByT(h)-1
            tmpIndexCountStart = tmpIndexCountStart + arrayCount(k);
        end
        tmpIndexCountEnd = tmpIndexCountStart + arrayCount(arrayLoadByT(h));
        for x =(tmpIndexCountStart):(tmpIndexCountEnd)-1
            matrixImage(x,h) = 1;
        end
        tmpIndexCountStart = 1;
        tmpIndexCountEnd = 1;
    end
    matrixImage
    I = mat2gray(matrixImage);
Z=figure
imshow(I)

saveas(Z,'Test.png')
end

