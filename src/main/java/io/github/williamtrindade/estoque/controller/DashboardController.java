package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EntradaDAO;
import io.github.williamtrindade.estoque.dao.SaidaDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DashboardController {

    @GetMapping("/")
    public String index(HttpServletRequest req, ModelMap modelMap) {
        if (new Auth().check(req)) {
            modelMap.addAttribute("valorEntradas" , new EntradaDAO().values());
            modelMap.addAttribute("valorSaidas" , new SaidaDAO().values());
            return "/app/dashboard";
        } else {
            return "redirect:/login";
        }
    }
}
