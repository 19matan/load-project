function saveMatrixAsImage(matrixImage_T, matrix_I, n, year)

    fileFolderTeam = ['imageByTeam20' year];
    fileFolderHourly_I = ['imageByHourly_I_20' year];
    
    mkdir (fileFolderTeam);
    mkdir (fileFolderHourly_I);
    currentFolder = pwd; 
    for i=1:n
        A = squeeze(matrixImage_T(i,:,:));
        filenameT = [currentFolder '\imageByTeam20' year '\image20' year '_T_' num2str(i,'%d') '.png'];
        imwrite(mat2gray(A),filenameT,'png');

        A2 = squeeze(matrix_I(i,:,:));
        filenameI = [currentFolder '\imageByHourly_I_20' year '\image20' year '_I_' num2str(i,'%d') '.png'];
        imwrite(mat2gray(A2),filenameI,'png');
    end


end