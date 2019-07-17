package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Entrada;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class EntradaDAO {

    public boolean create(Entrada entrada) {
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            String sql = "INSERT INTO entrada (produto_id, data, preco, quantidade) values (?, ?, ?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, entrada.getProduto().getId());
            pre.setDate(2, new Date(entrada.getData().getTime()));
            pre.setFloat(3, entrada.getPreco());
            pre.setInt(4, entrada.getQuantidade());

            if (pre.executeUpdate() > 0) {
                return true;
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Entrada> list() {
        List<Entrada> entradas = new LinkedList<>();
        try ( Connection conn = ConnectPostgres.getConnection() ) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM entrada;");
            while ( rs.next() ) {
                entradas.add( new Entrada (
                            rs.getInt("id"),
                            new ProdutoDAO().get(rs.getInt("produto_id")),
                            rs.getFloat("preco"),
                            rs.getDate("data"),
                            rs.getInt("quantidade")
                        )
                );
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return entradas;
    }

}
