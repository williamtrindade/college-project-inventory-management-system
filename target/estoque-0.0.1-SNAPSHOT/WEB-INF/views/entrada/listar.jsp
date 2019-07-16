<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/bootstrap.min.css' />" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
    <title>Estoque - Entradas</title>
</head>
<body>
<!--NAVBAR-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">Estoque</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/"/>">Dashboard </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="<c:url value="/produto/listar"/>">Estoque</a>
                </li>
                <li class="nav-item active">
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
                        <a class="dropdown-item" href="login/logout">Sair</a>
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
            <h3 style="margin-top:1%;text-align:center">Entradas</h3>
            <a href="<c:url value="/entrada/novo"/>" class="btn btn-primary mb-3"><i class="fas fa-plus"></i> Registrar Entrada</a>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <c:if test="${mensagem!=null}">
                        <div class="alert alert-success" role="alert">
                                ${mensagem}
                        </div>
                    </c:if>
                    <c:if test="${erro!=null}">
                        <div class="alert alert-danger" role="alert">
                                ${erro}
                        </div>
                    </c:if>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Nome do Produto</th>
                                <th scope="col">Preço</th>
                                <th scope="col">Data</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col">Editar</th>
                                <th scope="col">Excluir</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${entradas}" var="entrada">
                            <tr>
                                <th>${entrada.produto.nome}</th>
                                <td>${entrda.preco}</td>
                                <td>${entrada.data}</td>
                                <td>${entrada.quantidade}</td>
                                <td>
                                    <a href="<c:url value="/entrada/editar/${entrada.id}"/>" class="btn btn-info">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                </td>
                                <td>
                                    <form action="<c:url value="/entrada/excluir"/>" method="POST">
                                        <input type="hidden" name="produto_id" value="${entrada.id}">
                                        <button type="submit" class="btn btn-danger"> <i class='fas fa-trash'></i> Excluir</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
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
</html>
