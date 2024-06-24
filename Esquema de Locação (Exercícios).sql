// Exercício um

select C1.NOME as Cliente, F1.TITULO as Filme, L1.DATA_LOC as DataLocacao, L2.DATA_DEVOL as DataDevolucao
from cliente C1
join locacao L1 on C1.COD_CLI = L1.COD_CLI
join locacao_filme L2 on L1.COD_LOC = L2.COD_LOC
join filme F1 on L2.COD_FILME = F1.COD_FILME
where C1.NOME = 'Deonizio Martins'

// Exercícios dois

select C.NOME as Cliente, D.NOME as Dependente, DEP.PARENTESCO as Parentesco 
from cliente C
join dependente DEP on C.COD_CLI = DEP.COD_CLI
join cliente D on DEP.COD_DEP = D.COD_CLI;

// Exercicios três



