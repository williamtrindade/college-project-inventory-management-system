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
    <title>JetEstoque - Produtos</title>
</head>
<body>
    <!--NAVBAR-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">jetestoque</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/"/> ">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<c:url value="/produto/listar"/>">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cliente/listar"/>">Clientes</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/venda/listar"/>">Vendas</a>
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
                            <a class="dropdown-item" href="#">Sair</a>
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
                <h3 style="margin-top:1%;text-align:center">Produtos</h3>
                <a href="<c:url value="/produto/novo"/>" class="btn btn-primary mb-3"><i class="fas fa-add"></i> Cadastrar Produto</a>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <table class="table ">
                            <thead>
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Descrição</th>
                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${produtos}" var="produto">
                                    <tr>
                                        <th>${produto.nome}</th>
                                        <td>${produto.descricao}</td>
                                        <td>${produto.quantidade}</td>
                                        <td>
                                            <a href="/produto/editar/${produto.id}" class="btn btn-info">
                                                <i class="fas fa-edit"></i> Editar
                                            </a>
                                            <a href="/produto/excluir/${produto.id}" class="btn btn-danger">
                                                <i class="fas fa-delete"></i> Excluir
                                            </a>
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
