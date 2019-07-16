package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EntradaDAO;
import io.github.williamtrindade.estoque.dao.EstoqueDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import io.github.williamtrindade.estoque.model.Entrada;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

    @PostMapping("/entrada/novo")
    public String store(HttpServletRequest req, ModelMap modelMap, int produto_id, String preco, String data, int quantidade) throws ParseException {
        if(Auth.check(req)) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            String novoPreco = preco.replace(",", ".");
            Entrada entrada = new Entrada(new ProdutoDAO().get(produto_id), Float.parseFloat(novoPreco), formatter.parse(data), quantidade);

            // crio uma linha na tabela entrada
            if(new EntradaDAO().create(entrada)) {
                // somo o quantidade do produto que entrou na tabela estoque
                if(new EstoqueDAO().addQuantity(new EstoqueDAO().get(entrada.getProduto().getId()))) {
                    modelMap.addAttribute("mensagem", "Entrada Registrada com sucesso");
                    return "redirect:/entrada/listar";
                }
            } else {
                modelMap.addAttribute("erro", "Erro ao registrar Entrada");
                return "/entrada/editar";
            }
        } else {
            return "redirect:/login";
        }
        return "redirect:/login";
    }

    /*
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
