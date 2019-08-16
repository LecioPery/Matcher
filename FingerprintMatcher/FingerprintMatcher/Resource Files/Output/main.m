%Terminou um runAll, limpou:
%http://www.mathworks.com/help/matlab/ref/restoredefaultpath.html
%Faz uma pasta com mkdir, bota as imagens e sai dela com ajuda do cd.
%https://www.mathworks.com/help/matlab/ref/mkdir.html
%https://www.mathworks.com/help/matlab/ref/cd.html
%Manda todas as imagens lááá para dentro do LaTeX:
%https://www.mathworks.com/help/matlab/ref/movefile.html

numDB = ( FINGERS / DATABASE_SIZE );
%numTests = SAMPLES;
for j = 1:numDB
    databaseBuffer{j} = 0;
end
totalExecutions = TOTAL_BATCHES;

for i = 1:totalExecutions
    addpath( num2str(i) );
    
    currentExecution = runBatch;
    for j = 1:numDB
        databaseBuffer{j} = databaseBuffer{j} + currentExecution{j};
    end
    
    f{i} = strcat('f', num2str(i));
    mkdir(f{i})
    
    for j = 1:numDB
        movefile( strcat('Database', num2str(j), 'AverageMain.png'), f{i} )
        movefile( strcat('Database', num2str(j), 'AverageFNRxFPR.png'), f{i} )
        %for k = 1:numTests
        %    movefile( strcat('Database', num2str(k), '_', num2str(j), 'Main.png'), f{i} )
        %    movefile( strcat('Database', num2str(k), '_', num2str(j), 'FNRxFPR.png'), f{i} )
        %    movefile( strcat('Experiment', num2str(k), 'AverageMain.png'), f{i} )
        %    movefile( strcat('Experiment', num2str(k), 'AverageFNRxFPR.png'), f{i} )
        %end
    end
    movefile( f{i}, 'LaTeX/images/png' );
    
    %clear;
    close all;
    
    rmpath( num2str(i) );
end

for j = 1:numDB
    databaseBuffer{j} = databaseBuffer{j}/totalExecutions;
end

fileID = fopen('finalchapter.tex','w');
fprintf(fileID, '\\chapter{Monte Carlo}\n');
fprintf(fileID, '\\begin{itemize}\n');
for j = 1:numDB
    fprintf(fileID, '\\item ');
    fprintf(fileID, 'Database ');
    fprintf(fileID, num2str(j));
    fprintf(fileID, ': ');
    fprintf(fileID, num2str(databaseBuffer{j}));
    fprintf(fileID, '\n');
end
fprintf(fileID, '\\end{itemize}\n');
fclose(fileID);

%Psudocódigo:
% Enquanto houverem pastas:
%   Entra em uma pasta.
%       -> Executa os DatabaseXAverage
%       -> Move os resultados para "pasta"
% Repete
% Move todas as pastas para "LaTeX\\images\\filetype"