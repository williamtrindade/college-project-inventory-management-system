<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/bootstrap.min.css' />" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome/all.min.css"/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
    <title>Estoque - Cadastro de Entrada</title> </head>
<body>
<!--NAVBAR-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">Estoque</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" >
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/"/>">Dashboard </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/produto/listar"/>">Estoque</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/entrada/listar"/>">Entradas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/saida/listar"/>">Vendas</a>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <!--USUÁRIO LOGADO-->
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Usuario
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value="/login/logout"/>">Sair</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--MAIN-->
<div class="main">
    <div class="section">
        <div class="container">
            <h3 style="margin-top:1%;text-align:center">Cadastro de Entrada</h3>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <form method="POST" action="<c:url value="/entrada/novo"/>">
                        <div class="form-group">
                            <label for="produto">Selecione um produto</label>

                            <select class="form-control" name="produto" id="produto">
                                <c:forEach items="${produtos}" var="produto">
                                    <option value="${produto}">${produto.nome}</option>
                                </c:forEach>
                            </select>
                            <div class="form-group">
                                <label for="preco">Preço</label>
                                <input type="text" class="form-control" id="preco" placeholder="R$">
                            </div>
                            <div class="form-group">
                                <label for="data">Data</label>
                                <input type="date" class="form-control" id="data">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success"><i class="fas fa-check-circle"></i> Cadastrar</button>
                        <a href="<c:url value="/entrada/listar"/>" class="btn btn-outline-secondary">Voltar</a>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<script src="<c:url value="/resources/font-awesome/all.js"/>"/>
<script src="<c:url value='/resources/bootstrap/jquery-3.3.1.slim.min.js'/>"></script>
<script src="<c:url value='/resources/bootstrap/popper.min.js'/>"></script>
<script src="<c:url value='/resources/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/vanilla-masker.min.js'/>"></script>
<script src="<c:url value='/resources/js/script.js'/>"></script>


</html>
