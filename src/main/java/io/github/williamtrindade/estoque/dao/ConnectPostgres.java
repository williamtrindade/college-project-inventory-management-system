package io.github.williamtrindade.estoque.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectPostgres {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection (
                "jdbc:postgresql://localhost:5432/estoquejava",
                "postgres",
                "1234"
            );
        } catch (ClassNotFoundException | SQLException e) {
            
        }
        return conn;
    }
}