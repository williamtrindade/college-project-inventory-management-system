package io.github.williamtrindade.estoque.dto;

public class ProdutoDTO {
    private int id;
    private String nome;
    private String descricao;
    private int quantidade;

    public ProdutoDTO(int id, String nome, String descricao, int quantidade) {
        this.id         = id;
        this.nome       = nome;
        this.descricao  = descricao;
        this.quantidade = quantidade;
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

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
