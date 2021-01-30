<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="control.*"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/cadastrouser.css" media="screen" />
    <title>Cadastro Usuario</title>
</head>

<body>

    <!--OBJETO USER-->
    <form id="out"></form>
    <input type="hidden" id="user" name="user">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/user.js" type="text/javascript"></script>
        <% 
            Usuario user = null;
            try {
                long idUser = Long.parseLong(session.getAttribute("user-id").toString());
                if(idUser > 0){
                    user = new Usuario().user(Long.parseLong(session.getAttribute("user-id").toString()));
                }else{
                    %><script>getOut2();</script><% 
                }  
            }catch(NullPointerException e){
                user = new Usuario(-2,"usuario");
                %><script>setId();</script><%
                %><script>getOut2();</script><%
            }
        %>
    <!--OBJETO USER-->

    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->
    <%if(user.getId() > -2){%>
    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->

    <header>

        <div class="hd-gf hd-gf-burg">

            <div id="burg">
                <ion-icon name="menu-outline"></ion-icon>
            </div>

            <div class="burguer-sidebar" id="burg-on">

                <ul>
                    <p>Menu</p>
                    <li><i class="fa fa-search"></i> Pesquisa

                        <div class="burg-search">
                            <input type="text" placeholder="Procure produtos..." id="search-2">
                            <input type="button" value="Ok" class="burg-btn">
                        </div>

                    </li>
                    <li><i class="fa fa-smile"></i> Bem vindo <%=user.getNome()%>!</li>
                    <li id="home-header"><i class="fa fa-home"></i> Home</li>
                    <li id="eletronicos-header"><i class="fa fa-laptop"></i> Dispositivos Eletronicos</a></li>
                    <li id="acessorios-header"><i class="fa fa-plug"></i> Acessorios</li>
                    <li id="infantil-header"><i class="fa fa-baby"></i> Infantil</li>
                    <li id="fashion-header"><i class="fa fa-tshirt"></i> Fashion</li>
                    <li id="esportes-header"><i class="fa fa-futbol"></i> Esportes</li>
                    <li id="livros-header"><i class="fa fa-book"></i> Livros</li>
                    <li id="account-header"><i class="fa fa-user"></i> Meu Perfil</li>
                    <li id="produtos-header"><i class="fa fa-store-alt"></i> Meus Produtos</li>
                    <li id="carrinho-header"><i class="fa fa-shopping-cart"></i> Carrinho</li>
                    <li id="wallet-header"><i class="fa fa-wallet"></i> Carteira</li>
                    <li><i class="fa fa-phone"></i> Fale conosco</li>
                    <li id="logout-header"><i class="fa fa-door-open"></i> Logout</li>
                </ul>
                <div class="portifolio">
                    <p>Desenvolvido por Daniel Baumann <a href="#"><i class="fab fa-github"></i></a> <a href="#"><i
                                class="fab fa-linkedin"></i></a> </p>
                </div>

            </div>

        </div>

        <div class="hd-gf hd-gf-bag">
            <a href="#">
                <ion-icon name="storefront-outline"></ion-icon>
            </a>
            <p>BMNN</p>
        </div>

        <div class="hd-gf hd-gf-search">

            <div id="lupa">
                <ion-icon name="search-outline"></ion-icon>
            </div>

            <div class="search-sidebar" id="lupa-open">

                <input type="text" placeholder="Procure produtos..." class="search-sidebar-action" id="search">

                <div class="search-sidebar-select">
                    <i class="fa fa-angle-down"></i>
                </div>

                <div class="search-sidebar-close" id="lupa-close">
                    <i class="fa fa-times"></i>
                </div>

            </div>

        </div>

    </header>

    <section>

        <!--CADASTRO FORM-->
        <form id="main-form">
            <!--CADASTRO FORM-->

            <!--LISTA PRODUTOS-->
            <% 
                String lista = null;
                try {
                        lista = session.getAttribute("lista-produtos").toString();
                }catch(NullPointerException e){
                        lista = "";
                }
            %>
            <input type="hidden" id="lista-produtos" name="lista-produtos" value='<%=lista%>'>
            <!--LISTA PRODUTOS-->

            <!--Primeira box-->
            <div class="container-1">

                <div class="box-3">
                    <div class="box-1-text">
                        <div class="box-1-sub">
                            <h2>Dados de sua conta</h2>
                            <p>Estes sao os dados cadastrados em nosso sistema </p>
                        </div>
                        <div class="box-1-key">
                            <i class="fa fa-user-edit"></i>
                        </div>
                    </div>

                    <div class="box-1-submit">
                        <!--<form id="form-lg">-->

                        <!--ID-->
                        <input type="hidden" name="id" value='<%=user.getId()%>'>
                        <!--ID-->

                        <div class="btn-format">

                            <input type="text" value='<%=user.getNome()%>' readonly>

                        </div>

                        <div class="btn-format">

                            <input type="text" value='<%=user.getEmail()%>' readonly>

                        </div>

                        <div class="btn-format">

                            <input type="password" value='<%=user.getSenha()%>' id="senha" readonly>

                            <div class="eye" id="eye-senha">
                                <i class="fa fa-eye"></i>
                            </div>

                            <div class="close-eye" id="close-eye-senha">
                                <i class="fa fa-eye-slash"></i>
                            </div>

                        </div>

                        <div class="btn-format" id="box-cpf">

                            <input type="text" placeholder="CPF..." value='<%=user.getCpf()%>' id="cpf" name="cpf">

                            <div class="check-ok" id="check-cpf">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cpf">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cpf">
                                Somente numeros!CPF contem 11 digitos!
                            </div>

                        </div>

                        <div class="btn-format">

                            <input type="text" placeholder="Aniversario..." value='<%=user.getData_niver()%>' id="niver"
                                name="niver">

                            <input type="hidden" name="aniversario" value='<%=user.getData_niver()%>' id="aniversario">

                        </div>

                    </div>
                </div>

            </div>
            <!--Primeira box-->

            <div class="line-1">
                <!--linha horizontal mobile / vertical desktop-->
            </div>

            <!--Segunda box-->
            <div class="container-2">

                <div class="box-4">
                    <div class="box-1-text">
                        <div class="box-1-sub">
                            <h2>Endereco</h2>
                            <p>Atualize e cadastre aqui os seus dados de residencia</p>
                        </div>
                        <div class="box-1-key">
                            <i class="fa fa-home"></i>
                        </div>
                    </div>

                    <div class="box-1-submit">

                        <div class="btn-format" id="box-telefone">

                            <input type="text" placeholder="Telefone..." id="telefone" name="telefone"
                                value='<%=user.getFone()%>'>

                            <div class="check-ok" id="check-telefone">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-telefone">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-telefone">
                                Somente números!
                            </div>

                        </div>

                        <div class="btn-format" id="box-cep">

                            <input type="text" placeholder="CEP..." id="cep" name="cep" value='<%=user.getCep()%>'>

                            <div class="check-ok" id="check-cep">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cep">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cep">
                                Somente numeros!
                            </div>

                        </div>

                        <div class="btn-format" id="box-uf">

                            <input type="text" placeholder="UF..." list="ufs" id="uf" maxlength="2" name="uf"
                                value='<%=user.getUf()%>'>

                            <datalist id="ufs">
                                <option value="RJ">
                                <option value="SP">
                                <option value="MG">
                                <option value="ES">
                            </datalist>

                            <div class="check-ok" id="check-uf">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-uf">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-uf">
                                Estado não cadastrado!
                            </div>

                        </div>

                        <div class="btn-format" id="box-cidade">

                            <input type="text" placeholder="Cidade..." id="cidade" name="cidade"
                                value='<%=user.getCidade()%>'>

                            <div class="check-ok" id="check-cidade">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cidade">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cidade">
                                Somente letras!
                            </div>

                        </div>

                        <div class="btn-format" id="box-endereco">

                            <input type="text" placeholder="Endereco..." id="endereco" name="endereco"
                                value='<%=user.getEndereco()%>'>

                            <div class="check-ok" id="check-endereco">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-endereco">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-endereco">
                                Somente letras e numeros!
                            </div>

                        </div>

                        <div>
                            <input type="button" value="Atualizar dados..." id="updt">
                        </div>
                    </div>
                </div>

            </div>
            <!--Segunda box-->

            <!--CADASTRO FORM-->
        </form>
        <!--CADASTRO FORM-->

    </section>

    <div class="car-box" id="car-box">

        <div class="car-box-head">

            <div>
                <h3>Shopping cart</h3>
            </div>

            <div id="car-box-close">
                <p>x</p>
            </div>

        </div>

        <div class="car-box-empty" id="car-empty">
            <div>
                <img src="img/empty.jpg" alt="#">
            </div>
            <div>
                <p>Seu carrinho esta vazio</p>
            </div>
        </div>

        <!--DISPLAY DOS PRODUTOS NO CARRINHO-->
        <div class="car-box-display" id="car-display">

        </div>
        <!--DISPLAY DOS PRODUTOS NO CARRINHO-->

        <div class="car-box-ft" id="car-ft">

            <div>
                <p>Subtotal:</p>
                <p id='car-box-sub'>R$11.590,00</p>
            </div>

            <div>
                <input type="button" value="Carrinho" id="car-page" class="btn-car-box">
            </div>

            <div>
                <input type="button" value="Finalizar Compra" id="car-payment" class="btn-car-box btn-adjust">
            </div>

        </div>

    </div>

    <footer>

        <div class="ft-bx" id="home-footer">

            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="home-outline"></ion-icon>
                </a>
            </div>

            <div class="ft-bx-txt">
                <a href="#">
                    <p>Home</p>
                </a>
            </div>

        </div>

        <div class="ft-bx" id="produtos-footer">

            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="storefront-outline"></ion-icon>
                </a>
            </div>

            <div class="ft-bx-txt">
                <a href="#">
                    <p>MyStore</p>
                </a>
            </div>
        </div>

        <div class="ft-bx" id="car-footer">

            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="cart-outline"></ion-icon>
                </a>
            </div>

            <input type="text" class="qtd-view" id="qtd-car" value="0" disabled>

            <div class="ft-bx-txt">
                <a href="#">
                    <p>Carrinho</p>
                </a>
            </div>

        </div>

        <div class="ft-bx" id="wallet-footer">
    
            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="wallet-outline"></ion-icon>
                </a>
            </div>
    
            <div class="ft-bx-txt">
                <a href="#">
                    <p>Carteira</p>
                </a>
            </div>
    
        </div>

        <div class="ft-bx" id="account-footer">

            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="person-outline"></ion-icon>
                </a>
            </div>

            <div class="ft-bx-txt">
                <a href="#">
                    <p>Conta</p>
                </a>
            </div>

        </div>

        <div class="ft-bx" id="login-footer">

            <div class="ft-bx-gf">
                <a href="#">
                    <ion-icon name="log-out-outline"></ion-icon>
                </a>
            </div>

            <div class="ft-bx-txt">
                <a href="#">
                    <p>Entrar</p>
                </a>
            </div>

        </div>

    </footer>

    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE FOR ACESSADA SEM TER ID PRODUTO-->
    <%}else{%>
        <div class="main-error">
            <div class="me-title">
                <h1>BMN <ion-icon name="storefront-outline"></ion-icon>
                </h1>
                <p>Redirecionando para nossa pagina principal</p>
            </div>
            <div class="align-spin">
                <div class="spinner"></div>
            </div>
        </div>
    <%}%>
    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE FOR ACESSADA SEM TER ID PRODUTO-->

    <!--Arquivos JS-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/main.js"></script>
    <script src="js/cadastro.js"></script>
    <!--Arquivos JS-->

</body>

</html>