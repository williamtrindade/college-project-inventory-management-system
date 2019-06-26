<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <title>JetEstoque - Cadastro de Produto</title>
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
                        <a class="nav-link" href="home.html">Dashboard <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="produtos.html">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Clientes</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link" href="#">Vendas</a>
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
                <h3 style="margin-top:1%;text-align:center">Cadastro de Produto</h3>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <form method="POST" action="produtos.html">
                            <div class="form-group">
                                <label for="nome">Nome</label>
                                <input name="nome" type="text" class="form-control" id="nome" aria-describedby="nomeHelp" placeholder="Digite o nome">
                                <small id="nomeHelp" class="form-text text-muted">Dar um nome claro e simples te ajuda na pesquisa :).</small>
                            </div>
                            <div class="form-group">
                                <label for="descricao">Descrição</label>
                                <input name="descricao" type="text" class="form-control" id="descricao" aria-describedby="descHelp" placeholder="Digite a descrição">
                                <small id="nomeHelp" class="form-text text-muted">Descreva o produto.</small>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="quantidade">Quantidade</label>
                                        <input name="quantidade" type="number" class="form-control" id="quantidade">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="preco">Preço - BRL</label>
                                        <input name="preco" type="text" class="form-control" id="preco">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Cadastrar</button>
                            <a href="produtos.html" class="btn btn-outline-secondary">Voltar</a>
                        </form>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
</body>
<script src="bootstrap/jquery-3.3.1.slim.min.js"></script>
<script src="bootstrap/popper.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<script src="vanilla-masker.min.js"></script>
<script src="script.js"></script>
</html>