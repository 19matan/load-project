
function matrix_i = dataProcessingMatrix_i(t, n, AllLoadData)

 matrix_i = zeros(t-n, n, n); 
  load = [];
  sortLoad = [];
  %t = 8759;
  %n = 32;
  i = 1;
  while (t - i - (n - 1)) > 0
      for j = (t-i):-1:(t-i-n+1)
            load = [load AllLoadData(j)];
            sortLoad = [sortLoad AllLoadData(j)]; 
      end
      sortLoad=sort(sortLoad);
      for k = 1 : n
         for z = 1: n
             if load(k) == sortLoad(z)
                  matrix_i(i,z,k) = 1;
                  break
             end
         end
      end
                     
        i = i + 1;
        load = [];
        sortLoad = [];
        
  end
end
