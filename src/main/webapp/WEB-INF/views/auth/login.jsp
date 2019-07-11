<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-9">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/bootstrap.min.css' />" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
    <title>Estoque - Login</title>
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
                    <!--USUÃRIO NAO ESTÃ LOGADO-->
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="login.html">Login <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </ul>
            </div>
        </div>
    </nav>
    <!--MAIN-->
    <div class="main">
        <div class="section">
            <div class="container">
                <div class="row m-5 shadow pl-5 pr-5 pb-4 pt-3">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12" style="text-align: center;">
                                <img src="<c:url value='/resources/img/logo.png' />" alt="" height="150px;align-self:center">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <!--FORMULÃRIO DE LOGIN-->
                                <form method="POST">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Digite o seu email">
                                        <small id="emailHelp" class="form-text text-muted">Digite seu email ;).</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="senha">Senha</label>
                                        <input name="senha" type="password" class="form-control" id="senha" placeholder="Digite a sua senha">
                                    </div>
                                    <c:if test="${not empty $.{erro}">
                                        <div class="alert alert-danger" role="alert">
                                            E-mail ou senha incorretos
                                        </div>
                                    </c:if>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Mantenha conectado</label>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Fazer Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="<c:url value='/resources/bootstrap/jquery-3.3.1.slim.min.js'/>"></script>
<script src="<c:url value='/resources/bootstrap/popper.min.js'/>"></script>
<script src="<c:url value='/resources/bootstrap/bootstrap.min.js'/>"></script>
</html>
