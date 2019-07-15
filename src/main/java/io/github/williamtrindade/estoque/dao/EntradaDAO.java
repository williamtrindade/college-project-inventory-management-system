package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Entrada;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class EntradaDAO {

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
                            rs.getDate("data")
                        )
                );
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return entradas;
    }

}
