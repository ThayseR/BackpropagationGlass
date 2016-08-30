%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNIVERSIDADE FEDERAL DE OURO PRETO - UFOP
% DEPARTAMENTO DE CI�NCIAS EXATAS E APLICADAS - DECEA
% Prof. Talles Henrique de Medeiros          
% E.mail: talles.medeiros@decea.ufop.com
%                                                            
% Algoritmo Backpropagation, em nota��o matricial.
%                                                               
% Implementa��o em Matlab
% Note: x'      eh a transposta da matriz x
%       x.*y    eh o produto de x e y elemento por elemento
%                                                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%% Configura��es Iniciais das vari�veis
% Experimento sem MG
clear all;
close all;
clc;

load glassmat.txt

col_retirada = 1;
glassmatmodificada = glassmat(:, 1:col_retirada-1);
glassmatmodificada = [glassmatmodificada glassmat(:, col_retirada+1:end)];
patterns = glassmatmodificada(:, 1:8);
desired = glassmatmodificada(:, 9:end);
patterns = [patterns ones(size(patterns,1),1) ]; %adiciono o bias

netlm = newff(patterns', desired', [6,7], {'tansig', 'purelin'}, 'trainlm');
netlm = train(netlm, patterns', desired');
tlm_obtida = sim(netlm, patterns');

tlm_obtida_discreta=round(tlm_obtida)
diff = (desired' - tlm_obtida_discreta)

for i=1:214
    somadiff(i) = sum(abs(diff(:,i)));
end

for i=1:214
    if (somadiff(i)>=1)
       somadiff(i) = 1;
    end
end

erros = sum(somadiff);
perc_erro = erros/214;

erros
perc_erro
