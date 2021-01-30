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
    <title>Main</title>
</head>

<body>

    <!--MAIN FORM-->
    <form id="main-form">

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

        <!--OBJETO USER-->
        <input type="hidden" id="user" name="user">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
        <script src="js/user.js" type="text/javascript"></script>
            <% 
            	Usuario user = null;
                try {
                    long idUser = Long.parseLong(session.getAttribute("user-id").toString());
                    if(idUser == -1){
                        user = new Usuario(-1,"usuario");
                        %><script>userAct();</script><% 
                    }else{
                        user = new Usuario().user(Long.parseLong(session.getAttribute("user-id").toString()));
                    }   
                }catch(NullPointerException e){
                    user = new Usuario(-1,"usuario");
                    %><script>userAct();</script>
                      <script>setId();</script><% 
                }
            %>
        <!--OBJETO USER-->

        <!--ID MEU PRODUTO-->
        <input type="hidden" id="id-prod" name="id-prod">
        <!--ID MEU PRODUTO-->

        <!--PAGE ANUNCIANTE-->
        <input type="hidden" id="prod-vendor" name="prod-vendor">
        <input type="hidden" id="name-vendor" name="name-vendor">
        <!--PAGE ANUNCIANTE-->

        <!--SEARCH-->
        <input type="hidden" id="main-search" name="main-search">
        <!--SEARCH-->

    </form>
    <!--MAIN FORM-->

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

        <div class="banner-1">

            <div class="banner-1-title">
                <h2>Produto oficial</h2>
            </div>

            <div class="banner-1-txt">
                <p>Lorem ipsum dol sit amet sed do eiusmod tempor</p>
            </div>

            <div class="banner-1-btn-pst">
                <input type="button" class="banner-1-btn" value="Compre agora">
            </div>

            <div class="img-banner-1">
                <div class="banner-1-offer">
                    <input type="button" value="Oferta!" class="banner-1-dailyoffer">
                </div>
                <img src="img/shoesbn-1.jpg" alt="#">
            </div>

            <div class="banner-1-radio-pst">
                <input type="radio" class="banner-1-radio">
                <input type="radio" class="banner-1-radio">
                <input type="radio" class="banner-1-radio">
            </div>

        </div>

        <div class="banner-2">

            <div class="banner-2-img">
                <img src="img/bn1.jpg" alt="#">
            </div>

            <div class="banner-2-img">
                <img src="img/bn2.jpg" alt="#">
            </div>

            <div class="banner-2-img">
                <img src="img/bn3.jpg" alt="#">
            </div>

        </div>

        <div class="prod">

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
            <script>
                let pf = 0;
                let pr = 0;
                let desc = '';
            </script>

            <!--LISTA ELETRONICOS-->
            <% List<Produto>list = new Produto().esportes(user.getId());%>
            <!--LISTA ELETRONICOS-->

            <% int count = 1; %>

                <!--FOR PRODUTO-->
            <%for(Produto p : list){%>
                <!--FOR PRODUTO-->

                <div class="prod-box">

                    <div class="prod-box-desconto">
                        <input type="text" value="<%=p.getDesconto()%>%" class="desconto" id="desconto-<%=count%>">
                        <input type="text" value="DESTAQUE" class="destaque" id="destaque-<%=count%>">
                        <input type="hidden" value="<%=p.getPrecoFinal()%>" id="preco-final-<%=count%>">
                        <input type="hidden" value="<%=p.getPreco()%>" id="preco-<%=count%>">
                    </div>
    
                    <% String nomeId = p.getNome().replaceAll(" ","-");
                    nomeId = nomeId.replaceAll("/","-"); %>
                    
                    <div class="prod-box-img" id='<%=nomeId%>'>
                        <a href="#"><img src="img-produtos/<%=p.getImagem1()%>" alt="<%=p.getDescricao()%>"></a>
                    </div>
    
                    <div class="prod-box-btn">
                        <input type="button" value="Add Carrinho" class="btn-add"
                            ondblclick='add(
                                "<%=p.getId()%>",
                                "<%=p.getNome()%>",
                                "<%=p.getPreco()%>",
                                "<%=p.getPrecoFinal()%>",
                                "<%=p.getDesconto()%>",
                                "1",
                                "<%=p.getQtd()%>",
                                "img-produtos/<%=p.getImagem1()%>",
                                "<%=p.getUsuario().getNome()%>"
                                )'>
                    </div>
    
                    <div class="prod-box-title">
                        <h3><%=p.getNome()%></h3>
                        <p><a href="#"><%=p.getDescricao()%></a></p>
                    </div>
    
                    <div class="prod-box-star">
                        <div class="star">
                            <img src="img/stars.jpg" alt="#">
                        </div>
                        <p>6</p>
                    </div>
    
                    <div class="prod-box-price">
                        <p id="pf-<%=count%>"></p>
                        <p><strike id="stk-<%=count%>"></strike></p>
                    </div>
    
                    <div class="prod-box-vendor">
                        <p>Anunciante: <a onclick="pageVendor('<%=p.getId()%>','<%=p.getUsuario().getNome()%>')"><%=p.getUsuario().getNome()%></a></p>
                    </div>
    
                </div>
    
                <script>
                    $('#<%=nomeId%>').click(function () {
                        //lista-produtos
                        $("#lista-produtos").val(JSON.stringify(listaP));
                        $("#id-prod").val('<%=p.getId()%>');
                        let app = document.getElementById("main-form");
                        app.action = "ServDisplayProduto";
                        app.method = "POST";
                        app.submit();
                    });
    
                    //SCRIPT PARA DESCONTOS
                    pf = parseFloat($("#preco-final-<%=count%>").val());
                    $("#pf-<%=count%>").html(pf.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
                    pr = parseFloat($("#preco-<%=count%>").val());
                    $("#stk-<%=count%>").html(pr.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
                    //DESCONTO & DESTAQUE
                    desc = $("#desconto-<%=count%>").val();
                    if (desc == "0%") {
                        $("#desconto-<%=count%>").css('color', 'transparent');
                        $("#desconto-<%=count%>").css('border', 'transparent');
                        $("#destaque-<%=count%>").css('color', 'transparent');
                        $("#destaque-<%=count%>").css('border', 'transparent');
                        $("#stk-<%=count%>").css('color', 'transparent');
                        $("#stk-<%=count%>").css('border', 'transparent');
                    } else if (parseFloat(desc.replace('%', '') < 15)) {
                        $("#destaque-<%=count%>").css('color', 'transparent');
                        $("#destaque-<%=count%>").css('border', 'transparent');
                    }
    
    
                </script>
    
                <% count++; %>

                <!--FOR PRODUTO-->
            <%}%>
                <!--FOR PRODUTO-->

        </div>

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

    <!--Arquivos JS-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/main.js"></script>
    <!--Arquivos JS-->

</body>

</html>