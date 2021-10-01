create table pedido (
	cod_pedido INT PRIMARY KEY,
	cod_cliente INT,
	cod_boardgame INT,
	desconto INT,
	dt_pedido DATE,
	hr_pedido VARCHAR(50)
    FOREIGN KEY (cod_boardgame) REFERENCES boardgame(cod_boardgame),
    FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente)
);