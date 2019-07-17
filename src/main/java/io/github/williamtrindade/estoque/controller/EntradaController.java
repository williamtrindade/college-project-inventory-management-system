package io.github.williamtrindade.estoque.controller;

import io.github.williamtrindade.estoque.dao.EntradaDAO;
import io.github.williamtrindade.estoque.dao.EstoqueDAO;
import io.github.williamtrindade.estoque.dao.ProdutoDAO;
import io.github.williamtrindade.estoque.dao.SaidaDAO;
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
            model.addAttribute("entradas", new EntradaDAO().list());
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
            SimpleDateFormat parser =  new SimpleDateFormat("yyyy-MM-dd");
            // String to Date
            java.util.Date dataf = parser.parse(data);

            String novoPreco = preco.replace(",", ".");
            Entrada entrada = new Entrada(new ProdutoDAO().get(produto_id), Float.parseFloat(novoPreco), dataf, quantidade);

            // crio uma linha na tabela entrada
            if(new EntradaDAO().create(entrada)) {
                // somo o quantidade do produto que entrou na tabela estoque
                if(new EstoqueDAO().addQuantity(entrada.getProduto().getId(), entrada.getQuantidade())) {
                    modelMap.addAttribute("mensagem", "Entrada Registrada com sucesso");
                    return "redirect:/entrada/listar";
                }
            } else {
                modelMap.addAttribute("erro", "Erro ao registrar Entrada");
                return "/entrada/novo";
            }
        } else {
            return "redirect:/login";
        }
        return "redirect:/login";
    }
   
    @PostMapping("/entrada/excluir")
    public String destroy(HttpServletRequest req, ModelMap model,int entrada_id, int produto_id, int quantidade) {
        if(Auth.check(req)) {
            if(new SaidaDAO().productWasSell(produto_id)) {
                model.addAttribute("erro", "Não é possível remover a entrada, pois esse produto já teve saída!");
                model.addAttribute("entradas", new EntradaDAO().list());
                return "/entrada/listar";
            } else {
                if(new EntradaDAO().destroy(entrada_id) && new EstoqueDAO().subtractAmount(produto_id, quantidade)) {
                    model.addAttribute("mensagem", "Entrada Removido");
                    return "redirect:/entrada/listar";
                } else {
                    return "redirect:/login";
                }
            }
        } else {
            return "redirect:/login";
        }
    }
}
