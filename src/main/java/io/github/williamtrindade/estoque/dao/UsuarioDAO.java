package io.github.williamtrindade.estoque.dao;

import io.github.williamtrindade.estoque.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    public boolean create(Usuario usuario) {
        try (Connection conn = ConnectPostgres.getConnection()) {
            String sql = "INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, usuario.getNome());
            pre.setString(2, usuario.getEmail());
            pre.setString(3, usuario.getSenha());
            if(pre.executeUpdate() > 0) return true;
        } catch (Exception ex) {
        }
        return false;
    }

    public boolean validate(Usuario usuario) {
        try (Connection conn = ConnectPostgres.getConnection()) {
            String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setString(1, usuario.getEmail());
            preStmt.setString(2, usuario.getSenha());
            ResultSet rs = preStmt.executeQuery();             
            while(rs.next()) {             
                return true;       
            }         
         } catch(Exception ex) {
         }        
         return false;
    }
}