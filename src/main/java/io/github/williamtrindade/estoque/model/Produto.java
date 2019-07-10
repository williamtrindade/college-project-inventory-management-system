package io.github.williamtrindade.estoque.model;

public class Produto {
    private int id;
    private String nome;
    private String descricao;

    public Produto(int id, String nome, String descricao) {

    }

    public Produto(String nome, String descricao) {
        this.nome      = nome;
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
