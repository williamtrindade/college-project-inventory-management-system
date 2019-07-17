package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Estoque;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EstoqueDAO {

    public boolean create(int produtoInserido) {
        try (Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "INSERT INTO estoque (produto_id, quantidade) values (?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, produtoInserido);
            pre.setInt(2, 0);

            if (pre.executeUpdate() > 0) {
                return true;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addQuantity(int produto_id, int quantidade) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "UPDATE estoque SET quantidade = quantidade + ? WHERE produto_id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, quantidade);
            pre.setInt(2, produto_id);

            if ( pre.executeUpdate() > 0 ) {
                return true;
            }

        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean subtractAmount(int produto_id, int quantidade) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "UPDATE estoque SET quantidade = quantidade - ? WHERE produto_id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, quantidade);
            pre.setInt(2, produto_id);

            if ( pre.executeUpdate() > 0 ) {
                return true;
            }

        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public Estoque get(int id) {
        try (Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "SELECT * FROM estoque WHERE produto_id = ? ";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if ( rs.next() ) {
                Estoque estoque = new Estoque(
                        rs.getInt("id"),
                        new ProdutoDAO().get(rs.getInt("produto_id")),
                        rs.getInt("quantidade")
                );
                return estoque;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return null;
    }
}
