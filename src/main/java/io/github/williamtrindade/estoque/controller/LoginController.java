package io.github.williamtrindade.estoque.controller;

//import io.github.williamtrindade.estoque.dao.UsuarioDAO;

import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String create(Usuario user, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) { // não tem sessão
            if(new UsuarioDAO().validate(user)) {
                session.setAttribute("user", user);
                return "app/dashboard";
            } else {
                return "/login";
            }
        } else {
            return "/app/dashboard";
        }
    }
    
    @RequestMapping("/login")
    public String getCreate(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) {
            return "/login";
        } else {
            return "/app/dashboard";
        }
    }
    
}