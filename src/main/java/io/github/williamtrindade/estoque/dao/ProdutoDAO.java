package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.dto.ProdutoDTO;
import io.github.williamtrindade.estoque.model.Produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProdutoDAO {

    public int insertProduto(Produto produto) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "INSERT INTO produto (nome, descricao) values (?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, produto.getNome());
            pre.setString(2, produto.getDescricao());

            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<ProdutoDTO> getProdutos() {
        List<ProdutoDTO> produtos = new LinkedList<>();
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select p.id, p.nome, p.descricao, e.quantidade " + "from produto p, estoque e where p.id = e.produto_id;" );
            while ( rs.next() ) {
                produtos.add( new ProdutoDTO(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getInt("quantidade")
                        )
                );
            }
        } catch ( Exception e ) {
        }
        return produtos;
    }

    public boolean update(Produto produto) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "UPDATE produto SET nome = ?, descricao = ? WHERE id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, produto.getNome());
            pre.setString(2, produto.getDescricao());
            pre.setInt(3, produto.getId());
            // Teste
            System.out.println("sql -> " + sql);
            if ( pre.executeUpdate() > 0 ) {
                return true;
            }

        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public Produto getProduto(int id) {
        try (Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "SELECT * FROM USER WHERE id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery("SELECT * FROM USER WHERE id = ?");
            if ( rs.next() ) {
                Produto produto = new Produto(rs.getInt("id"), rs.getString("nome"), rs.getString("descricao"));
                return produto;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return null;
    }
}
