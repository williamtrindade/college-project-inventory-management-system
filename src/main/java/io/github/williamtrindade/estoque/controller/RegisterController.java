package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.model.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController
{
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String create(Usuario user, HttpServletRequest req)
    {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) { // não tem sessão
            if(new UsuarioDAO().create(user)) {
                session.setAttribute("user", user);
                return "app/dashboard";
            } else {
                return "register";
            }
        } else {
            return "/app/dashboard";
        }
    }
    
    @RequestMapping(value = "/register",  method = RequestMethod.GET)
    public String getCreate(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) {
            return "/register";
        } else {
            return "/app/dashboard";
        }
    }
    
}
