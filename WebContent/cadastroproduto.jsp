<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.util.List" %>
<%@page import="control.*" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/cadastroproduto.css" media="screen" />
    <title>Main</title>

</head>

<body>

    <!--OBJETO USER-->
    <form id="out"></form>
    <input type="hidden" id="user" name="user">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/user.js" type="text/javascript"></script>
        <% 
            Usuario user = null;
            List<Produto>list = null;
            Produto prod = null;
            String listaProdutos = "";
            try {
                long idUser = Long.parseLong(session.getAttribute("user-id").toString());
                if(idUser > 0){
                    user = new Usuario().user(idUser);
                    list = new Produto().list(user.getId());
                    prod = new Produto().meuProduto(Long.parseLong(session.getAttribute("meu-prod-id").toString()));
                    listaProdutos = session.getAttribute("lista-produtos").toString();
                }else{
                    %><script>setId();</script><%
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
    
        <div class="main-display">
    
            <div class="cover">
                <img src='img-produtos/<%=prod.getImagem1()%>'>
            </div>
    
            <div class="thumbs">
    
                <div class="thumbs-img">
                    <img src="img-produtos/<%=prod.getImagem1()%>" class="active">
                </div>
    
                <div class="thumbs-img">
                    <img src="img-produtos/<%=prod.getImagem2()%>">
                </div>
    
                <div class="thumbs-img">
                    <img src="img-produtos/<%=prod.getImagem3()%>">
                </div>
    
                <div class="thumbs-img">
                    <img src="img-produtos/<%=prod.getImagem4()%>">
                </div>
    
            </div>
    
            <div class="display-text">
            
                <div class="text-fill">
            
                        <label for="nome">Produto</label>
            
                        <input type="text" id="nome" value="<%=prod.getNome()%>" disabled>

                        <!--FORM UPDATE PRODUTO-->
                    <form id="main-form">
                        <!--FORM UPDATE PRODUTO-->

                                <!--ID MEU PRODUTO-->
                                <input type="hidden" id="id-prod" name="id-prod">
                                <!--ID MEU PRODUTO-->

                                <!--LISTA PRODUTOS-->
                                <input type="hidden" id="lista-produtos" name="lista-produtos" value='<%=listaProdutos%>'>
                                <!--LISTA PRODUTOS-->

                </div>
            
                <div class="text-fill">
                    <label for="descricao">Descricao</label>
            
                    <input type="text" id="descricao" value="<%=prod.getDescricao()%>" disabled>
                </div>
            
                <div class="text-fill">
                    <label for="marca">Marca</label>
            
                    <input type="text" id="marca" value="<%=prod.getMarca()%>" disabled>
                </div>
            
                <div class="text-fill">
                    <label for="preco">Preco</label>
            
                    <input type="text" id="preco" value="<%=prod.getPreco()%>" disabled>
                </div>
            
                <div class="text-fill">
                    <label for="qtd">Qtd disponivel</label>
            
                    <input type="text" id="qtd" name="qtd" value="<%=prod.getQtd()%>"
                        oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                </div>
            
                <div class="text-fill">
                    <label for="disponibilidade">Disponivel?</label>
            
                    <div class="text-fill-check">
                        <input type="checkbox" id="disponibilidade">
                        <input type="hidden" id="dispo" name="dispo" value="<%=prod.getAtivo()%>">
                    </div>
                </div>
            
                <div class="text-fill">
                    <label for="desconto">Desconto</label>
            
                    <input type="text" id="desconto" name="desconto" value="<%=prod.getDesconto()%>"
                        oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                </div>
            
                <div class="text-fill">
                    <label for="aval">Avaliacoes</label>
            
                    <input type="text" id="aval" value="4,7     27 avaliacoes" disabled>
                </div>
            
                <div>
                    <input type="button" value="Update" class="btn-display-update" id="btn-prod-update">
            
                    <!--FORM UPDATE PRODUTO-->
                    </form>
                    <!--FORM UPDATE PRODUTO-->
            
                </div>
            
            </div>
    
        </div>
    
        <!--DISPLAY PRODUTOS-->
        <div class="prod">
    
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    
            <!--PARA LISTA VAZIA-->
            <%if(list == null || list.isEmpty()){%>
                <div class="no-prod">
                    <p>Sem produtos cadastrados...<i class="fa fa-sad-tear"></i></p>
                </div>
            <%}else{%>
                    <!--PARA LISTA VAZIA-->
    
                    <!--FOR PRODUTOS-->
                <%for(Produto p : list){if(p.getId()!=Long.parseLong(session.getAttribute("meu-prod-id").toString())){%>
                        <!--FOR PRODUTOS-->
    
                <div class="prod-box">
                
                    <div class="prod-box-desconto">
                        <!--
                        <input type="text" value="-27%" class="desconto">
                        <input type="text" value="DESTAQUE" class="destaque">
                        -->
                    </div>

                    <% String nomeId = p.getNome().replaceAll(" ","-");
                    nomeId = nomeId.replaceAll("/","-"); %>
                
                    <div class="prod-box-img" id='<%=nomeId%>'>
                        <a href="#"><img src='img-produtos/<%=p.getImagem1()%>' alt="#"></a>
                    </div>
                
                    <!--
                    <div class="prod-box-btn">
                        <input type="button" value="Add Carrinho" class="btn-add">
                    </div>
                    -->
                
                    <div class="prod-box-title">
                        <h3>
                            <%=p.getNome()%>
                        </h3>
                        <p><a href="#">
                                <%=p.getDescricao()%>
                            </a></p>
                    </div>
                
                    <div class="prod-box-star">
                        <div class="star">
                            <img src="img/stars.jpg" alt="#">
                        </div>
                        <p>6</p>
                    </div>
                
                    <div class="prod-box-price">
                        <p>R$<%=p.getPreco()%>
                        </p>
                        <!-- 
                        if else para desconto caso exista
                        <p><strike>R$<%=p.getPreco()%></strike></p>
                        -->
                    </div>
                
                    <div class="prod-box-vendor">
                        <!--<p>Anunciante: <a href="#"><%=user.getNome()%></a></p>-->
                    </div>
                
                </div>
    
                <script>
                    $('#<%=nomeId%>').click(function () {
                        $("#id-prod").val('<%=p.getId()%>');
                        let app = document.getElementById("main-form");
                        app.action = "ServPageMyProd";
                        app.method = "POST";
                        app.submit();
                    });
                </script>
    
            <!--FOR PRODUTOS-->
            <% }}} %>>
            <!--FOR PRODUTOS-->

        </div>
        <!--DISPLAY PRODUTOS-->
    
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
    <script src="https://kit.fontawesome.com/a076d05399.js" type="text/javascript"></script>
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"
        type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <script src="js/cadastroproduto.js" type="text/javascript"></script>
    <!--Arquivos JS-->

</body>

</html>