package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.UsuarioDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import io.github.williamtrindade.estoque.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String index(HttpServletRequest req) {
        if (new Auth().check(req)) {
            return "/app/dashboard";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/login/logout")
    public String logout((HttpServletRequest req) {
        if (new Auth().check(req)) {
            // logout
            return "redirect:/login";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/login")
    public String store(Usuario user, HttpServletRequest req, ModelMap model) {
        if (new Auth().check(req)) {
            return "redirect:/";
        } else {
            if(new UsuarioDAO().validate(user)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                return "redirect:/";
            } else {
                model.addAttribute("erro", "E-mail ou senha incorretos");
                return "/login";
            }
        }
    }
}
