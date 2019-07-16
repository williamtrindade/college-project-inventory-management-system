package io.github.williamtrindade.estoque.model;

import java.util.Date;

public class Entrada {
    private int id;
    private Produto produto;
    private float preco;
    private Date data;
    private int quantidade;

    public Entrada() {
    }

    public Entrada(Produto produto, float preco, Date data, int quantidade) {
        this.produto = produto;
        this.preco = preco;
        this.data = data;
        this.quantidade = quantidade;
    }

    public Entrada(int id, Produto produto, float preco, Date data, int quantidade) {
        this.id = id;
        this.produto = produto;
        this.preco = preco;
        this.data = data;
        this.quantidade = quantidade;
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

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
