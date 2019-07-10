package io.github.williamtrindade.estoque.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class EstoqueDAO {

    public boolean insertEstoque(int produtoInserido) {
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

}
