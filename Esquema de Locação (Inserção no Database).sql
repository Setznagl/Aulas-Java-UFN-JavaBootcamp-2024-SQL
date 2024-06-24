-- Criando alguns generos para teste

insert into genero(NOME) values
('Terror'),
('Drama'),
('Aventura');

-- inserindo categorias

insert into categoria(NOME,VALOR) values
('Lançamento',5.00),
('Padrão',5.00),
('Clássico',5.00);

-- inserindo alguns filmes para teste

insert into filme(TITULO_ORIGINAL , TITULO , QUANTIDADE , COD_CAT , COD_GEN) values
('The Green Mile','A Espera de Um Milagre',3,(select COD_CAT from categoria where NOME = 'Clássico'),(select COD_GEN from genero where NOME = 'Drama')),   
('Forrest Gump','Forrest Gump o Contador de Histórias',2,(select COD_CAT from categoria where NOME = 'Clássico'),(select COD_GEN from genero where NOME = 'Drama')),
('The Truman Show','O Show de Truman',7,(select COD_CAT from categoria where NOME = 'Clássico'),(select COD_GEN from genero where NOME = 'Drama')),
('IT 2','IT a COISA Parte 2',8,(select COD_CAT from categoria where NOME = 'Lançamento'),(select COD_GEN from genero where NOME = 'Terror')),
('Inside Out','Divertida Mente',6,(select COD_CAT from categoria where NOME = 'Padrão'),(select COD_GEN from genero where NOME = 'Aventura'));

-- inserindo atores

insert into ator(NOME) values
('Tom Hanks'),
('Robin Wright'),
('Bill Skarsgard'),
('Jaeden Martell'),
('Michael Clarke Duncan'),
('David Morse'),
('Jim Carrey'),
('Kaitlyn Dias');

-- inserindo atores nos filmes 

insert into filme_ator (COD_ATOR, COD_FILME, ATOR, DIRETOR) values
((select COD_ATOR from ator where NOME = 'Tom Hanks'), (select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Tom Hanks'), (select COD_FILME from filme where TITULO = 'Forrest Gump o Contador de Histórias'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Bill Skarsgard'), (select COD_FILME from filme where TITULO = 'IT a COISA Parte 2'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Jaeden Martell'), (select COD_FILME from filme where TITULO = 'IT a COISA Parte 2'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Michael Clarke Duncan'), (select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'David Morse'), (select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Jim Carrey'), (select COD_FILME from filme where TITULO = 'O Show de Truman'), 'S', 'N'),
((select COD_ATOR from ator where NOME = 'Kaitlyn Dias'), (select COD_FILME from filme where TITULO = 'Divertida Mente'), 'S', 'N');

-- inserindo alguns endereços

insert into endereco (LOGRADOURO, TIPO_LOG, COMPLEMENTO, CIDADE, UF, CEP, NUMERO, BAIRRO) values
('Rua das Flores', 'Rua', 'Ap 268', 'São Paulo', 'SP', '01009800', '980', 'Centro'),
('Avenida Paulista', 'Avenida', 'Conj. 200', 'São Paulo', 'SP', '01311200', '2000', 'Bela Vista'),
('Rua Augusta', 'Rua', 'Casa', 'São Paulo', 'SP', '01412100', '300', 'Consolação');

-- Inserindo Dados na Tabela PROFISSOES:

insert into profissao (NOME) values
('Engenheiro'),
('Médico'),
('Professor'),
('Enfermeiro'),
('Farmacêutico'),
('Dentista'),
('Jornalista');

-- Inserindo clientes

insert into cliente (CPF, NOME, TELEFONE, COD_PROF) values
('98345678901', 'Deonizio Martins', '11987654321', (select COD_PROF from profissao where NOME = 'Médico')),
('73556789012', 'Joao Silveira', '11976543210', (select COD_PROF from profissao where NOME = 'Jornalista')),
('22553288007', 'Lucimara Pereira', '18876422211', (select COD_PROF from profissao where NOME = 'Dentista'));


-- Inserindo dependentes

insert into dependente (COD_CLI, COD_DEP, PARENTESCO) values
((select COD_CLI from cliente where NOME = 'Deonizio Martins'), (select COD_CLI from cliente where NOME = 'Lucimara Pereira'), 'Esposa');

-- Inserindo endereços aos clientes

insert into cli_endereco (COD_END, COD_CLI) values
((select COD_END from endereco where LOGRADOURO = 'Rua das Flores' and NUMERO = '980'), (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
((select COD_END from endereco where LOGRADOURO = 'Avenida Paulista' and NUMERO = '2000'), (select COD_CLI from cliente where NOME = 'Joao Silveira')),
((select COD_END from endereco where LOGRADOURO = 'Rua Augusta' and NUMERO = '300'), (select COD_CLI from cliente where NOME = 'Lucimara Pereira'));

-- Inserindo locacoes

insert into locacao (DATA_LOC, DESCONTO, MULTA, SUB_TOTAL, COD_CLI) values
('2024-06-23', 5.00, 0.00, 10.00, (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
('2024-06-22', 5.00, 5.00, 30.00, (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
('2024-05-29', 5.00, 8.00, 53.00, (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
('2024-05-15', 0.00, 0.00, 20.00, (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
('2024-05-07', 5.00, 1.00, 1.00, (select COD_CLI from cliente where NOME = 'Joao Silveira')),
('2024-05-01', 0.00, 15.00, 135.00, (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
('2024-04-29', 5.00, 0.00, 15.00, (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
('2024-04-27', 5.00, 8.00, 48.00, (select COD_CLI from cliente where NOME = 'Joao Silveira'));

-- Inserindo filmes nas locacoes
	
insert into locacao_filme (COD_LOC, COD_FILME, VALOR, NUM_DIAS, DATA_DEVOL) values
((select COD_LOC from locacao where DATA_LOC = '2024-06-23' and COD_CLI = (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
	(select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 5.00, 3, '2024-06-26'),
((select COD_LOC from locacao where DATA_LOC = '2024-06-22' and COD_CLI = (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
	(select COD_FILME from filme where TITULO = 'O Show de Truman'), 5.00, 6, '2024-06-28'),	
((select COD_LOC from locacao where DATA_LOC = '2024-05-29' and COD_CLI = (select COD_CLI from cliente where NOME = 'Deonizio Martins')),
	(select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 5.00, 9, '2024-05-29'),
((select COD_LOC from locacao where DATA_LOC = '2024-05-15' and COD_CLI = (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
	(select COD_FILME from filme where TITULO = 'O Show de Truman'), 5.00, 4, '2024-05-19'),
((select COD_LOC from locacao where DATA_LOC = '2024-05-07' and COD_CLI = (select COD_CLI from cliente where NOME = 'Joao Silveira')),
	(select COD_FILME from filme where TITULO = 'Divertida Mente'), 5.00, 1, '2024-05-08'),
((select COD_LOC from locacao where DATA_LOC = '2024-05-01' and COD_CLI = (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
	(select COD_FILME from filme where TITULO = 'A Espera de Um Milagre'), 5.00, 24, '2024-05-25'),
((select COD_LOC from locacao where DATA_LOC = '2024-04-29' and COD_CLI = (select COD_CLI from cliente where NOME = 'Lucimara Pereira')),
	(select COD_FILME from filme where TITULO = 'IT a COISA Parte 2'), 5.00, 4, '2024-05-03'),
((select COD_LOC from locacao where DATA_LOC = '2024-04-27' and COD_CLI = (select COD_CLI from cliente where NOME = 'Joao Silveira')),
	(select COD_FILME from filme where TITULO = 'Forrest Gump o Contador de Histórias'), 5.00, 9, '2024-05-06');
