clc;
clear all;

%A = readmatrix('data_update.csv');

data = readtable('data_update.csv');
AllLoadData=data(:,4);
AllLoadData = table2array(AllLoadData);
x = AllLoadData;
ts1 = timeseries(AllLoadData,1:length(AllLoadData));

ts1.Name = 'Load Data';
ts1.TimeInfo.Units = 'hour';
ts1.TimeInfo.StartDate = '01-Jan-2009';     % Set start date.
ts1.TimeInfo.Format = 'mmm dd, yy';       % Set format for display on x-axis.

ts1.Time = ts1.Time - ts1.Time(1);        % Express time relative to the start date.

plot(ts1)


AllLoadDataOf2009 = [];
AllLoadDataOf2010 = [];
traingSet_09 = [];
traingSet_10 = [];
testSet_09 = [];
testSet_10 = [];

for i = 1:8759
     AllLoadDataOf2009(1,i) = AllLoadData(i,1);
end
   
for i = 8760:17518
     AllLoadDataOf2010(1,(i-8759)) = AllLoadData(i,1);
end

for i = 1: 7883
    traingSet_09(1,i) = AllLoadDataOf2009(1,i);
    traingSet_10(1,i) = AllLoadDataOf2010(1,i);
end

for i = 7884: 8759
    testSet_09(1,(i-7883)) = AllLoadDataOf2009(1,i);
    testSet_10(1,(i-7883)) = AllLoadDataOf2010(1,i);
end

ts = timeseries(AllLoadDataOf2009)

%AllLoadDataOf2009=int16(AllLoadDataOf2009);
%AllLoadDataOf2010=int16(AllLoadDataOf2010);

matrix_i_2009 =  dataProcessingMatrix_i(size(AllLoadDataOf2009,2),32,AllLoadDataOf2009);
matrix_i_2010 =  dataProcessingMatrix_i(size(AllLoadDataOf2010,2),32,AllLoadDataOf2010);

matrixImage_2009 = matrixImageByTeam(size(AllLoadDataOf2009,2), 32, AllLoadDataOf2009);
matrixImage_2010 = matrixImageByTeam(size(AllLoadDataOf2010,2), 32, AllLoadDataOf2010);

%MTbyT = trytodomatrixbyT()
%MTmI = trytodomatrix_i()

saveMatrixAsImage(matrixImage_2009, matrix_i_2009, (size(matrixImage_2009,1)), '09');

saveMatrixAsImage(matrixImage_2010, matrix_i_2010, (size(matrixImage_2010,1)), '10');








