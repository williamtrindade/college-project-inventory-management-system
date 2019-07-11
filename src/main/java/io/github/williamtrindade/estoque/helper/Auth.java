package io.github.williamtrindade.estoque.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Auth {
    public static boolean check(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return (session.getAttribute("user") != null);
    }
}
