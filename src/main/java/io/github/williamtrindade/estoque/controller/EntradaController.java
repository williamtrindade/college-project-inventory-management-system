package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EntradaDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EntradaController {

    @GetMapping("/entrada/listar")
    public String index(HttpServletRequest req, ModelMap model) {
        if (Auth.check(req)) {
            model.addAttribute("produtos", new EntradaDAO().list());
            return "/entrada/listar";
        } else {
            return "redirect:/login";
        }
    }


    @GetMapping("/entrada/novo")
    public String create(HttpServletRequest req, ModelMap modelMap) {
        if(Auth.check(req)) {
            modelMap.addAttribute("produtos", new ProdutoDAO().list());
            return "/entrada/novo";
        } else {
            return "redirect:/login";
        }
    }
    /**
    @PostMapping("/produto/novo")
    public String store(HttpServletRequest req, String nome, String descricao) {
        if(Auth.check(req)) {
            int produtoInserido = new ProdutoDAO().create(new Produto(nome, descricao));
            boolean estoqueInserido = new EstoqueDAO().create(produtoInserido);
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

    @GetMapping("/produto/editar/{id}")
    public String edit(@PathVariable(required = false) int id, HttpServletRequest req, ModelMap model) {
        if(Auth.check(req)) {
            int id_produto = Integer.parseInt(String.valueOf(id));
            if(id_produto > 0) {
                model.addAttribute("produto", new ProdutoDAO().get(id_produto));
                return "/produto/editar";

            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/produto/editar")
    public String update(HttpServletRequest req, Produto produto, ModelMap model) {
        if(Auth.check(req)) {
            if(new ProdutoDAO().update(produto)) {
                model.addAttribute("mensagem", "Produto Atualizado");
                return "redirect:/produto/listar";
            } else {
                model.addAttribute("erro", "Erro ao atualizar Produto");
                return "/produto/editar/" + produto.getId();
            }
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/produto/excluir")
    public String destroy(HttpServletRequest req, int produto_id, ModelMap model) {
        if(Auth.check(req)) {
            if(new ProdutoDAO().destroy(produto_id)) {
                model.addAttribute("mensagem", "Produto Removido");
                return "redirect:/produto/listar";
            } else {
                model.addAttribute("erro", "Erro ao remover Produto");
                return "redirect:/produto/listar";
            }
        } else {
            return "redirect:/login";
        }
    }
**/
}
