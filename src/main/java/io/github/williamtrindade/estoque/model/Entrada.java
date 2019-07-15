package io.github.williamtrindade.estoque.model;

import java.util.Date;

public class Entrada {
    private int id;
    private Produto produto;
    private float preco;
    private Date data;

    public Entrada() {
    }

    public Entrada(Produto produto, float preco, Date data) {
        this.produto = produto;
        this.preco = preco;
        this.data = data;
    }

    public Entrada(int id, Produto produto, float preco, Date data) {
        this.id = id;
        this.produto = produto;
        this.preco = preco;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
