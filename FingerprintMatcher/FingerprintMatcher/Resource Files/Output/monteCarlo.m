numDB = 4;
numTests = 5;

buffer = zeros(20);

totalExecutions = 100;

for i = 1:totalExecutions
	addpath(num2str(i));
	
	EER{i} = runMonteCarlo;

	rmpath(num2str(i));
end

fileID = fopen('finalchapter.tex', 'w');
fprintf(fileID, '\\chapter{Monte Carlo}\n');
fprintf(fileID, 'All the EERs:');
fprintf(fileID, '\\begin{itemize}\n');
EERbuffer = 0;
for i = 1:totalExecutions
	for j = 1:numTests
		for k = 1:numDB
			fprintf(fileID, '\\item ');
			fprintf(fileID, 'Database ');
			fprintf(fileID, num2str(i));
			fprintf(fileID, '.');
			fprintf(fileID, num2str(j));
			fprintf(fileID, '.');
			fprintf(fileID, num2str(k));
			fprintf(fileID, ': ');
			fprintf(fileID, num2str(EER{i}{j}{k}));
			fprintf(fileID, '\n');
			
			EERbuffer = EERbuffer + EER{i}{j}{k};
            buffer(k + (j-1)*numDB) = buffer(k + (j-1)*numDB) + EER{i}{j}{k};
		end
	end
end

for i=1:20
   buffer(i) = buffer(i)/totalExecutions; 
end

fprintf(fileID, '\\end{itemize}\n');
for j=1:5
    for k=1:4
        fprintf(fileID, strcat('EER(', num2str(k), ')(', num2str(j), '): ', num2str( EERbuffer/(totalExecutions * numTests * numDB) ), ' '));
    end
    fprintf(fileID, strcat('\\\\\n'));
end
fprintf(fileID, strcat('Final EER: ', num2str( EERbuffer/(totalExecutions * numTests * numDB) ), '\n'));
fclose(fileID);
movefile('finalchapter.tex', 'LaTeX/chapters/standard');

% Psudocódigo:
% Enquanto houverem pastas :
%   Entra em uma pasta.
%	   ->Executa os DatabaseXAverage
%	   ->Move os resultados para "pasta"
%   Repete
%   Move todas as pastas para "LaTeX\images\filetype"
