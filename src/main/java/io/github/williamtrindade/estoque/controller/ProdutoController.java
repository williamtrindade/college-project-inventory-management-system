package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EstoqueDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.model.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {
    @GetMapping
    public String index(ModelMap model) {
        model.addAttribute("produtos", new ProdutoDAO().getProdutos());
        return "/produto/listar";
    }

    @PostMapping("/cadastrar")
    public String cadastrar(String nome, String descricao) {
        int produtoInserido = new ProdutoDAO().insertProduto(new Produto(nome, descricao));
        boolean estoqueInserido = new EstoqueDAO().insertEstoque(produtoInserido);
        if(produtoInserido != 0 && estoqueInserido == true) {
            return "redirect:/produtos";
        }

        return "redirect:/produtos/cadastrar";
    }


    @GetMapping("/cadastrar")
    public String returnCadastrar(){
        return "/produto/novo";
    }
}
