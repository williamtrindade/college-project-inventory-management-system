package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Saida;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class SaidaDAO {

    public Float values() {
        try (Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "SELECT SUM(preco) FROM saida;";
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if ( rs.next() ) {
                return rs.getFloat("sum");
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean create(Saida saida) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "INSERT INTO saida (produto_id, data, preco, quantidade) values (?, ?, ?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, saida.getProduto().getId());
            pre.setDate(2, new Date(saida.getData().getTime()));
            pre.setFloat(3, saida.getPreco());
            pre.setInt(4, saida.getQuantidade());

            if (pre.executeUpdate() > 0) {
                return true;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Saida> list() {
        List<Saida> saidas = new LinkedList<>();
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM saida;");
            while ( rs.next() ) {
                saidas.add( new Saida (
                            rs.getInt("id"),
                            new ProdutoDAO().getAnyStatus(rs.getInt("produto_id")),
                            rs.getFloat("preco"),
                            rs.getDate("data"),
                            rs.getInt("quantidade")
                        )
                );
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return saidas;
    }

    public boolean productWasSell(int produto_id) {
        List<Saida> saidas = new LinkedList<>();
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "SELECT * FROM saida where produto_id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, produto_id);
            ResultSet rs = pre.executeQuery();
            if(rs.next()) {
                return true;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean destroy(int id) {
        try (Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "DELETE FROM saida WHERE id = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.execute();
            return true;
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

}
