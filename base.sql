/* Lógico_1: */

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    email TEXT,
    senha TEXT
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    descricao TEXT,
    preco NUMERIC(12, 2),
    quantidade INT
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    data_nascimento_ DATE,
    telefone TEXT
);

CREATE TABLE vendas (
    data DATE,
    id SERIAL PRIMARY KEY,
    fk_clientes_id SERIAL
);

CREATE TABLE produtos_vendas (
    fk_produtos_id SERIAL,
    fk_vendas_id SERIAL
);
 
ALTER TABLE vendas ADD CONSTRAINT FK_vendas_2
    FOREIGN KEY (fk_clientes_id)
    REFERENCES clientes (id)
    ON DELETE CASCADE;
 
ALTER TABLE produtos_vendas ADD CONSTRAINT FK_produtos_vendas_1
    FOREIGN KEY (fk_produtos_id)
    REFERENCES produtos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE produtos_vendas ADD CONSTRAINT FK_produtos_vendas_2
    FOREIGN KEY (fk_vendas_id)
    REFERENCES vendas (id)
    ON DELETE SET NULL;
