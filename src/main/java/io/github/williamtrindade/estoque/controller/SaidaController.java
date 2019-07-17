package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.SaidaDAO;
import io.github.williamtrindade.estoque.dao.EstoqueDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.helper.Auth;
import io.github.williamtrindade.estoque.model.Saida;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
public class SaidaController {

    @GetMapping("/saida/listar")
    public String index(HttpServletRequest req, ModelMap model) {
        if (Auth.check(req)) {
            model.addAttribute("saidas", new SaidaDAO().list());
            return "/saida/listar";
        } else {
            return "redirect:/login";
        }
    }


    @GetMapping("/saida/novo")
    public String create(HttpServletRequest req, ModelMap modelMap) {
        if(Auth.check(req)) {
            modelMap.addAttribute("produtos", new ProdutoDAO().list());
            return "/saida/novo";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/saida/novo")
    public String store(HttpServletRequest req, ModelMap modelMap, int produto_id, String preco, String data, int quantidade) throws ParseException {
        if(Auth.check(req)) {
            SimpleDateFormat parser =  new SimpleDateFormat("yyyy-MM-dd");
            // String to Date
            java.util.Date dataf = parser.parse(data);

            String novoPreco = preco.replace(",", ".");
            Saida saida = new Saida(new ProdutoDAO().get(produto_id), Float.parseFloat(novoPreco), dataf, quantidade);

            // crio uma linha na tabela saida
            if(new SaidaDAO().create(saida)) {
                // somo o quantidade do produto que entrou na tabela estoque
                if(new EstoqueDAO().subtractAmount(saida.getProduto().getId(), saida.getQuantidade())) {
                    modelMap.addAttribute("mensagem", "Saida Registrada com sucesso");
                    return "redirect:/saida/listar";
                }
            } else {
                modelMap.addAttribute("erro", "Erro ao registrar Saida");
                return "/saida/novo";
            }
        } else {
            return "redirect:/login";
        }
        return "redirect:/login";
    }
   
    @PostMapping("/saida/excluir")
    public String destroy(HttpServletRequest req, ModelMap model,int saida_id, int produto_id, int quantidade) {
        if(Auth.check(req)) {
            if(new SaidaDAO().destroy(saida_id) && new EstoqueDAO().addQuantity(produto_id, quantidade)) {
                model.addAttribute("mensagem", "Saida Removido");
                return "redirect:/saida/listar";
            } else {
                return "redirect:/login";
            }
        } else {
            return "redirect:/login";
        }
    }
}
