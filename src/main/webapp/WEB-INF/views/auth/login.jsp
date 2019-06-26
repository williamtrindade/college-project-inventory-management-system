<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <title>JetEstoque - Login</title>
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
                    <!--USUÁRIO NAO ESTÁ LOGADO-->
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
                                <img src="img/logo.png" alt="" height="150px;align-self:center">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <!--FORMULÁRIO DE LOGIN-->
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
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Mantenha conectado</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Fazer Login</button>
                                    <a href="">Já tenho conta!</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="bootstrap/jquery-3.3.1.slim.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
</html>