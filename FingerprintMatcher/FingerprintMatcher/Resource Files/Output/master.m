clear all
close all
clc

%Número de experimentos
N = 100

% Guardar todos os resultados
RESULTADOS = zeros(4, 5, N)

% Caminho para os arquivos com resutados parciais
% Computador de casa
% raiz = ['cd ''E:\Dropbox\UnB\Artigos\RECUSADOS\IJCB 2017 - Touchless FingerCodes - Recusado\FingerprintMatcher\FingerprintMatcher\Resource Files\Output''']
% Computador McGill
raiz = ['cd ''D:\Dropbox\Dropbox\UnB\Artigos\RECUSADOS\IJCB 2017 - Touchless FingerCodes - Recusado\FingerprintMatcher\FingerprintMatcher\Resource Files\Output''']
eval(raiz)

% Iterando nas pastas (experimentos, até 100)
for pasta = 1:N
    pasta
    % Qual banco está utilizando (de 1 a 4)
    for banco = 1: 4
        % Em que linha você está (de 1 a 5)
        for row = 1:5
            % Cria um nome de arquivo com dados, de acordo com o banco e a linha em que está
            %name = [caminho '\' num2str(pasta) '\' num2str(row) '\Database' num2str(row) '_' num2str(banco) '.m']
            
            comando = ['cd ' num2str(pasta)];
            eval(comando);
            comando = ['cd ' num2str(row)];
            eval(comando);
            
            % Executa o comando para carregar os dados (y0 e y1)
            Dados = ['Database' num2str(row) '_' num2str(banco) '_MC'];
            EER = eval(Dados);
                     
            % Com os dados carregados, calcula a EER
            %EER = retEER(y0, y1)
            
            % Armazemar o resultado no respectivo local na matriz de resultados
            RESULTADOS(banco, row, pasta) = EER;
            
            % Volta para a raiz
            eval(raiz);
            
        end
    end
end

close all
EXPERIMENTOS = RESULTADOS(:)
index = histfit(EXPERIMENTOS, round(sqrt(length(EXPERIMENTOS))), 'normal')
index(1).FaceColor = [.9 .9 .9];
i = find( abs(index(2).XData-mean(EXPERIMENTOS)) == min(abs(index(2).XData-mean(EXPERIMENTOS))))
hold on
stem(index(2).XData(i), index(2).YData(i),'ob','LineWidth',2)

j = find(abs((abs(index(2).XData) - abs(mean(EXPERIMENTOS) - std(EXPERIMENTOS)))) == min(abs((abs(index(2).XData) - abs(mean(EXPERIMENTOS) - std(EXPERIMENTOS)))))  )
k = find(abs((abs(index(2).XData) - abs(mean(EXPERIMENTOS) + std(EXPERIMENTOS)))) == min(abs((abs(index(2).XData) - abs(mean(EXPERIMENTOS) + std(EXPERIMENTOS)))))  )
stem([index(2).XData(j) index(2).XData(k)], [index(2).YData(j) index(2).YData(k) ],'xk','LineWidth',2)

set(gca,'fontsize', 14)

grid on
xlabel('Equal Error Rate')
ylabel('Number of Experiments')

h = legend('Histogram', 'Gaussian fit', ['M_{EEE} = ' num2str(round(mean(10000*EXPERIMENTOS))/100) '%'], ['S_{EER} = \pm' num2str(round(std(10000*EXPERIMENTOS))/100) '%'])
set(h,'fontsize', 10)


% Mostrar o resultado recém inserido
%RESULTADOS(:, :, pasta)




