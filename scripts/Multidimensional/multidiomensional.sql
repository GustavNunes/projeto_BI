
CREATE SEQUENCE dim_categoria_sk_categoria_seq;

CREATE TABLE dim_categoria (
                sk_categoria INTEGER NOT NULL DEFAULT nextval('dim_categoria_sk_categoria_seq'),
                nk_categoria INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT sk_categoria PRIMARY KEY (sk_categoria)
);


ALTER SEQUENCE dim_categoria_sk_categoria_seq OWNED BY dim_categoria.sk_categoria;

CREATE SEQUENCE dim_data_sk_data_seq;

CREATE TABLE dim_data (
                sk_data INTEGER NOT NULL DEFAULT nextval('dim_data_sk_data_seq'),
                mes INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                dia INTEGER NOT NULL,
                semana VARCHAR(10) NOT NULL,
                ano VARCHAR(4) NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);


ALTER SEQUENCE dim_data_sk_data_seq OWNED BY dim_data.sk_data;

CREATE SEQUENCE dim_fabricante_sk_fabricante_seq;

CREATE TABLE dim_fabricante (
                sk_fabricante INTEGER NOT NULL DEFAULT nextval('dim_fabricante_sk_fabricante_seq'),
                nk_fabricante INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT sk_fabricante PRIMARY KEY (sk_fabricante)
);


ALTER SEQUENCE dim_fabricante_sk_fabricante_seq OWNED BY dim_fabricante.sk_fabricante;

CREATE SEQUENCE dim_cliente_sk_cliente_seq;

CREATE TABLE dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                idade INTEGER NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE dim_cliente_sk_cliente_seq OWNED BY dim_cliente.sk_cliente;

CREATE SEQUENCE dim_boardgame_sk_boardgame_seq;

CREATE TABLE dim_boardgame (
                sk_boardgame VARCHAR NOT NULL DEFAULT nextval('dim_boardgame_sk_boardgame_seq'),
                nk_boardgame INTEGER NOT NULL,
                preco REAL NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT sk_boardgame PRIMARY KEY (sk_boardgame)
);


ALTER SEQUENCE dim_boardgame_sk_boardgame_seq OWNED BY dim_boardgame.sk_boardgame;

CREATE TABLE ft_pedido (
                sk_boardgame VARCHAR NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_fabricante INTEGER NOT NULL,
                sk_categoria INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_cod_pedido INTEGER NOT NULL,
                md_valor_final REAL NOT NULL
);


ALTER TABLE ft_pedido ADD CONSTRAINT dim_categoria_ft_pedido_fk
FOREIGN KEY (sk_categoria)
REFERENCES dim_categoria (sk_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_data_ft_pedido_fk
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_fabricante_ft_pedido_fk
FOREIGN KEY (sk_fabricante)
REFERENCES dim_fabricante (sk_fabricante)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_cliente_ft_pedido_fk
FOREIGN KEY (sk_cliente)
REFERENCES dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_boardgame_ft_pedido_fk
FOREIGN KEY (sk_boardgame)
REFERENCES dim_boardgame (sk_boardgame)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;