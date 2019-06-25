package io.github.williamtrindade.estoque.controller;

//import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.model.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String create(Usuario user, HttpServletRequest req)
    {
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
    
    @RequestMapping(value = "/login",  method = RequestMethod.GET)
    public String getCreate(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null) {
            return "/login";
        } else {
            return "/app/dashboard";
        }
    }
    
}