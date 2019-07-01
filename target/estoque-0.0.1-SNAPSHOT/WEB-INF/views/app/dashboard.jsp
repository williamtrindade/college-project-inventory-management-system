<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <title>JetEstoque - Home</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="home.html">Dashboard <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="produtos.html">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="clientes.html">Clientes</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link" href="vendas.html">Vendas</a>
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
                <h3 style="margin-top:1%;text-align:center">Bem Vindo a sua Dashboard</h3>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card rounded" style="margin-top: 4%;text-align: center;">
                            <div class="card-header">   
                                Vendas             
                            </div>
                            <div class="card-body">
                                <h1>500</h1>
                                <p class="card-text">Vendas Realizadas.</p>
                                <a href="nova-venda.html" class="btn btn-primary">Registar Nova Venda</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="card rounded" style="margin-top: 4%;">
                            <div class="card-header">   
                                Produtos             
                            </div>
                            <div class="card-body">
                                <h1>500</h1>
                                <p class="card-text">Produtos cadastrados.</p>
                                <a href="#" class="btn btn-primary">Visualizar Produtos</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="card rounded" style="margin-top: 4%;">
                            <div class="card-header">   
                                Clientes             
                            </div>
                            <div class="card-body">
                                <h1>20</h1>
                                <p class="card-text">Clientes cadastrados.</p>
                                <a href="#" class="btn btn-primary">Visualizar Produtos</a>
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