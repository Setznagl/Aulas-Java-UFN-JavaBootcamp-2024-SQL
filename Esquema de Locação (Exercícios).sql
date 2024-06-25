/* Exercício 01 
Listar todos os filmes alugados por um cliente específico, 
incluindo a data de locação e a data de devolução.*/

select C1.NOME as Cliente, F1.TITULO as Filme, L1.DATA_LOC as DataLocacao, L2.DATA_DEVOL as DataDevolucao
from cliente C1
join locacao L1 on C1.COD_CLI = L1.COD_CLI
join locacao_filme L2 on L1.COD_LOC = L2.COD_LOC
join filme F1 on L2.COD_FILME = F1.COD_FILME
where C1.NOME = 'Deonizio Martins'

/* Exercício 02 
Obter uma lista de clientes e seus dependentes.*/

select C.NOME as Cliente, D.NOME as Dependente, DEP.PARENTESCO as Parentesco 
from cliente C
join dependente DEP on C.COD_CLI = DEP.COD_CLI
join cliente D on DEP.COD_DEP = D.COD_CLI;

/* Exercício 03
Listar todos os filmes de um determinado gênero.*/

select F.COD_FILME as idFilme , F.TITULO as Filmes , G.NOME as Generos
from filme F
join genero G on F.COD_GEN = G.COD_GEN
where G.NOME = 'Drama';

/* Exercício 04
Exibir todos os clientes que têm uma profissão específica.*/

select C.COD_CLI as codCliente , C.NOME as nomeCliente , P.NOME
from cliente C
join profissao P on C.COD_PROF = P.COD_PROF
where P.NOME = 'Médico';

/* Exercício 05
Encontrar todos os filmes em uma categoria específica com quantidade 
disponível maior que 5.*/

select F.COD_FILME as codigoFilme , F.TITULO as Titulo , F.QUANTIDADE 
	as Estoque, C.NOME as nomeCategoria
from filme F
join categoria C on F.COD_CAT = C.COD_CAT
where C.NOME = 'Clássico' and F.QUANTIDADE > 5;

/* Exercício 06
Listar todos os atores que participaram de filmes com um determinado título.*/

select A.COD_ATOR as id_Ator , A.NOME as nome_Ator , FA.COD_ATOR, FA.COD_FILME,
	F.TITULO as TituloFilmes
from ator A
join filme_ator FA on A.COD_ATOR = FA.COD_ATOR
join filme F on FA.COD_FILME = F.COD_FILME
where F.TITULO = 'A Espera de Um Milagre'

/* Exercício 07
Obter o endereço completo de um cliente específico.*/

select C.COD_CLI as cliente_id , C.NOME, E.LOGRADOURO, E.COMPLEMENTO,
	E.CIDADE, E.UF, E.CEP, E.NUMERO, E.BAIRRO
from cliente C
join cli_endereco CE on C.COD_CLI = CE.COD_CLI
join endereco E on CE.COD_END = E.COD_END
where C.NOME = 'Deonizio Martins';

/* Exercício 08
Listar todos os filmes e seus respectivos gêneros e categorias.*/

select F.COD_FILME as id_filme , F.TITULO as Titulo

