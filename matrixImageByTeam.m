function matrixImage = matrixImageByTeam(t, n, AllLoadData)

    matrixImage = zeros((t-n), n, n);% 8759 - 32 = 8727
    tmpIndexCountStart = 1;
    tmpIndexCountEnd = 1;
    load = [];
    %t = 8760
    %n = 32
    i = 1;
    while (t - i - (n - 1)) > 0
        for j = (t-i+1):-1:(t-i-n+1)
            load = [load,AllLoadData(j)];
        end
        arrayLoadByT = zeros(1,n);
        for y = 1 : n
            if (load(y)) >= 18000 && (load(y)) <= 23800
                arrayLoadByT(1,y) = 1;
            end
            if (load(y)) >= 23801 && (load(y)) <= 29600
                arrayLoadByT(1,y) = 2;
            end
            if (load(y)) >= 29601 && (load(y)) <= 35400
                arrayLoadByT(1,y) = 3;
            end
            if (load(y)) >= 35401 && (load(y)) <= 41200
                arrayLoadByT(1,y) = 4;
            end
            if (load(y)) >= 41201 && (load(y)) <= 47200
                arrayLoadByT(1,y) = 5;
            end
            if (load(y)) >= 47201 && (load(y)) <= 52800
                arrayLoadByT(1,y) = 6;
            end
            if (load(y)) >= 52801 && (load(y)) <= 58600
                arrayLoadByT(1,y) = 7;
            end
            if (load(y)) >= 58601 && (load(y)) <= 64400
                arrayLoadByT(1,y) = 8;
            end
            if (load(y)) >= 64401 && (load(y)) <= 70200
                arrayLoadByT(1,y) = 9;
            end
            if (load(y)) >= 70201 && (load(y)) <= 76000
                arrayLoadByT(1,y) = 10;
            end
        end

        arrayCount = zeros(1,10);
        for m = 1:n
            countTmp = (arrayLoadByT(m));
            arrayCount(countTmp) = arrayCount(countTmp) + 1;
        end

        for h = 1:32
            for k = 1: (arrayLoadByT(h)) -1
                tmpIndexCountStart = tmpIndexCountStart + arrayCount(k);
            end
            tmpIndexCountEnd = tmpIndexCountStart + arrayCount(arrayLoadByT(h));
            for x = tmpIndexCountStart : tmpIndexCountEnd - 1
                matrixImage(i,x,h) = 1;
            end
            tmpIndexCountStart = 1;
            tmpIndexCountEnd = 1;
        end

        i = i + 1;
        load = [];
    end
end
            
            