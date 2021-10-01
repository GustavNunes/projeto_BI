create table boardgame (
	cod_boardgame INT PRIMARY KEY,
	nome VARCHAR(43),
	cod_fabricante INT,
	cod_categoria INT,
	quantidade_pessoas INT,
	idade_recomendada VARCHAR(3),
	preco DECIMAL(5,2),
	FOREIGN KEY (cod_fabricante) REFERENCES fabricante(cod_fabricante),
	FOREIGN KEY (cod_categoria) REFERENCES categoria(cod_categoria)
);