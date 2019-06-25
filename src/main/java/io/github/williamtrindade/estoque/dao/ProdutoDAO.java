package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProdutoDAO {

    public boolean create (Produto produto) {
        try (Connection conn = ConnectPostgres.getConnection()) {
            String sql = "INSERT INTO produto (nome, descricao, preco, quantidade) " + "values (?, ?, ?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, produto.getNome());
            pre.setString(2, produto.getDescricao());
            pre.setFloat(3, produto.getPreco());
            pre.setInt(4, produto.getQuantidade());
            // Teste
            System.out.println("sql -> "+sql);
            if(pre.executeUpdate() > 0){
                return true;
            }

        }catch(Exception e ){
            return false;
        }
        return false;
    }

    public ArrayList<Produto> getProdutos() {
        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection conn = ConnectPostgres.getConnection()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM produtos");
            while(rs.next()) {
                Produto produto;
                produto = new Produto(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("descricao"),
                    rs.getFloat("preco"),
                    rs.getInt("quantidade"));
                produtos.add(produto);
            }
        } catch(Exception e ) {
        }
        return produtos;
    }
}