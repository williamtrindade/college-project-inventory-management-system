package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.helper.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DashboardController {

    @GetMapping("/")
    public String index(HttpServletRequest req) {
        if (new Auth().check(req)) {
            return "/app/dashboard";
        } else {
            return "redirect:/login";
        }
    }
}
