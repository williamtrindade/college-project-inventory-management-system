package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EstoqueDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import io.github.williamtrindade.estoque.model.Produto;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class ProdutoController {

    @GetMapping("/produto/listar")
    public String index(HttpServletRequest req, ModelMap model) {
        if (Auth.check(req)) {
            model.addAttribute("produtos", new ProdutoDAO().getProdutos());
            return "/produto/listar";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/produto/novo")
    public String create(HttpServletRequest req) {
        if(Auth.check(req)) {
            return "/produto/novo";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/produto/novo")
    public String store(HttpServletRequest req, String nome, String descricao) {
        if(Auth.check(req)) {
            int produtoInserido = new ProdutoDAO().insertProduto(new Produto(nome, descricao));
            boolean estoqueInserido = new EstoqueDAO().insertEstoque(produtoInserido);
            if(produtoInserido != 0 && estoqueInserido == true) {
                return "redirect:/produto/listar";
            } else {
                ModelMap model = new ModelMap();
                model.addAttribute("erro", "Erro ao Cadastrar Produto");
                return "redirect:/produto/novo";
            }
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping('/pruduto/editar')
    public string edit(HttpServletRequest req) {
        if(Auth.check(req)) {

        } else {
            
        }
    }
}
