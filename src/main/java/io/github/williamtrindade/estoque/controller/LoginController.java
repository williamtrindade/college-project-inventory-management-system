package io.github.williamtrindade.estoque.controller;

//import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String create(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) {
            return "/auth/login";
        } else {
            return "/app/dashboard";
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String store(Usuario user, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) { // não tem sessão
            if(new UsuarioDAO().validate(user)) {
                session.setAttribute("user", user);
                return "/app/dashboard";
            } else {
                return "/auth/login";
            }
        } else {
            return "/app/dashboard";
        }
    }
}
