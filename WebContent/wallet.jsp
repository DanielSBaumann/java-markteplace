<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.*"%>
<%@page import="java.util.List"%>
<%@page import="control.*"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/wallet.css" media="screen" />
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
                    if(idUser <= 0){
                        user = new Usuario(-2,"usuario");
                        %><script>userAct();</script><%
                        %><script>getOut();</script><% 
                    }else{
                        user = new Usuario().user(Long.parseLong(session.getAttribute("user-id").toString()));
                    }   
                }catch(NullPointerException e){
                    user = new Usuario(-2,"usuario");
                    %><script>userAct();</script><%
                    %><script>setId();</script><%
                    %><script>getOut();</script><% 
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

        <!--CARD INFO-->
        <input type="hidden" id="main-titular" name="main-titular" >
        <input type="hidden" id="main-card" name="main-card" >
        <input type="hidden" id="main-mes" name="main-mes" >
        <input type="hidden" id="main-ano" name="main-ano" >
        <input type="hidden" id="main-sec" name="main-sec" >
        <input type="hidden" id="main-flag" name="main-flag" >
        <input type="hidden" id="remove-card" name="remove-card" >
        <!--CARD INFO-->

    </form>
    <!--MAIN FORM-->

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

        <div class="wallet">

            <div class="wallet-saldo">

                <%Saldo saldo = new Saldo().saldo(user.getId());%>

                <div class="ws-img">
                    <img src="img/cash.png" alt="cash">
                </div>

                <div class="ws-cash">
                    <p>Saldo Atual</p>
                    <p><strong>R$<%=saldo.getTotal()%></strong></p>
                </div>
            </div>

            <div class="wallet-sale">
            
                <div class="ws-title">
                    <p>Ultimas Vendas Efetuadas</p>
                </div>

                <div class="wallet-sale-box">

                    <!--Lista de vendas efetuadas-->
                    <%List<ListaProduto>list = new ListaProduto().selectByUserId(user.getId());%>
                    <!--Lista de vendas efetuadas-->

                    <!--PARA LISTA VAZIA-->
                    <%if(list == null || list.isEmpty()){%>
                        <div class="ws-box-3">
                            <div class="ws2-box-title">
                                <p><strong style="color: rgb(119, 113, 113);">Sem itens vendidos...<i class="fa fa-sad-tear"></i></strong></p>
                            </div>
                        </div>
                    <%}else{%>
                    <!--PARA LISTA VAZIA-->

                    <!--FOR PRODUTOS-->
                    <%for(ListaProduto lp : list){ %>
                    <!--FOR PRODUTOS-->

                    <div class="ws-box">

                        <div class="ws-box-title">
                            <p><strong><%=lp.getProduto().getNome()%></strong></p>
                            <p>Pedido #000<%=lp.getTr().getId()%> 14/01/2021</p>
                        </div>

                        <div class="ws-box-price">
                            <p>(<%=lp.getQtd()%>x)<strong>R$<%=lp.getProduto().getPrecoFinal()%></strong></p>
                        </div>

                    </div>

                    <!--FOR PRODUTOS-->
                    <% }} %>
                    <!--FOR PRODUTOS-->

                </div>

            </div>

            <div class="wallet-sale">
            
                <div class="ws-title">
                    <p>Ultimas Compras Realizadas</p>
                </div>

                <div class="wallet-sale-box">

                    <!--Lista de vendas efetuadas-->
                    <%List<Transacao>tr = new Transacao().list(user.getId());%>
                    <!--Lista de vendas efetuadas-->
                        
                    <!--PARA LISTA VAZIA-->
                    <%if(tr == null || tr.isEmpty()){%>
                        <div class="ws-box-3">
                            <div class="ws2-box-title">
                                <p><strong style="color: rgb(119, 113, 113);">Sem compras realizadas...<i class="fa fa-sad-tear"></i></strong></p>
                            </div>
                        </div>
                    <%}else{%>
                    <!--PARA LISTA VAZIA-->
                        
                    <!--FOR PRODUTOS-->
                    <%for(Transacao transacao : tr){ %>
                    <!--FOR PRODUTOS-->

                    <div class="ws-box">

                        <div class="ws-box-title">
                            <p><strong>Pedido #000<%=transacao.getId()%> <%=transacao.getData()%></strong></p>
                            <p>*Acessar detalhes do pedido</p>
                        </div>

                        <div class="ws-box-price">
                            <p>Total: <strong>R$<%=transacao.getSubtotal()%></strong></p>
                        </div>

                    </div>

                    <!--FOR PRODUTOS-->
                    <% }} %>
                    <!--FOR PRODUTOS-->

                </div>

            </div>

            <div class="wallet-sale">
            
                <div class="ws-title">
                    <p>Informacoes Financeiras</p>
                </div>

                <div class="ws-card">

                    <div class="credit-card-box">

                        <div class="ccb-top">

                            <div>
                                <p><strong>Informacoes do cartao <i class="fa fa-credit-card"></i></strong></p>
                            </div>

                            <div>
                                <label for="titular">Titular</label>
                                <input type="text" id="titular" placeholder="Nome do titular..." 
                                oninput="this.value = this.value.replace(/[^a-zA-z %.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                        
                            <div>
                            
                                <label for="num-cartao">Nº Cartao</label>
                                <input 
                                    type="text" 
                                    id="num-cartao" 
                                    placeholder="0000 0000 0000 0000" 
                                    maxlength="16" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                            
                                <div id="card-logo">
                                    <i id="card-logo-1" class="fab fa-cc-visa"></i>
                                    <i id="card-logo-2" class="fab fa-cc-mastercard"></i>
                                    <i id="card-logo-3" class="fab fa-cc-amex"></i>
                                    <img id="card-logo-4" src="img/elo.png" alt="#">
                                </div>

                            </div>
                        
                        </div>

                        <div class="ccb-bottom">
                        
                            <div>
                                <label for="mes">Mes</label>
                                <input type="text" id="mes" placeholder="MM" maxlength="2" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                                <p>/</p>
                            </div>
                        
                            <div>
                                <label for="ano">Ano</label>
                                <input type="text" id="ano" placeholder="AAAA" maxlength="4" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                        
                            <div>
                                <label for="sec-cod">Cod. Seg.</label>
                                <input type="text" id="sec-cod" placeholder="123" maxlength="3" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                        
                        </div>

                    </div>

                    <div class="ws-card-bottom">

                        <div class="ws-card-msg">
                        
                            <p id="ppc-msg-1" style="display: none;">Cartao verificado! <i class="fa fa-check"></i></p>
                        
                            <p id="ppc-msg-2">Cartao invalido! <i class="fa fa-times"></i></p>
                        
                        </div>

                        <div class="ws-card-btn">

                            <input type="button" value="salvar cartao" class="card-btn" id="save-card">

                        </div>

                        <div class="ws-card-reset">

                            <p id="ppc-msg-3">Resetar informacoes <i class="fa fa-redo"></i></p>

                        </div>

                    </div>

                </div>

                <div class="wallet-sale-box-2">

                    <!--Lista de cartoes aqui-->
                    <%List<CartaoUsuario> card = new CartaoUsuario().list(user.getId());%>
                    <!--Lista de cartoes aqui-->

                    <!--PARA LISTA VAZIA-->
                    <%if(card == null || card.isEmpty()){%>
                        <div class="ws-box-3">
                            <div class="ws2-box-title">
                                <p><strong style="color: rgb(119, 113, 113);">Sem cartoes cadastrados...<i class="fa fa-sad-tear"></i></strong></p>
                            </div>
                        </div>
                    <%}else{%>
                    <!--PARA LISTA VAZIA-->
                                            
                    <!--FOR PRODUTOS-->
                    <%for(CartaoUsuario cr : card){ 
                        
                        String finalNum = "";

                        if(cr.getFlag().equals("amex")){
                            finalNum = cr.getNum().substring(11);
                        }else{
                            finalNum = cr.getNum().substring(12);
                        }
                                                        
                        %>
                    <!--FOR PRODUTOS-->

                    <div class="ws-box-2">
                        
                        <div class="card-saved-box">

                            <div class="cs-img">
                                <img src="img/<%=cr.getFlag()%>.jpg" alt="<%=cr.getFlag()%> logo">
                            </div>

                            <div class="cs-num">

                                <input type="password" class="input-num" value="1234"  readonly>
                                <input type="password" class="input-num" value="1234" readonly>
                                <input type="password" class="input-num" value="1234" readonly>
                                <input type="text" class="input-num" value="<%=finalNum%>" readonly>

                            </div>

                            <div class="cs-date">

                                <p>Validade <strong><%=cr.getMonth()%> / <%=cr.getYear()%></strong></p>

                            </div>

                        </div>

                        <div class="card-saved-bottom">
                            <input type="button" onclick="removeCard('<%=cr.getId()%>')" value="remover cartao" class="remove-card">
                        </div>

                    </div>

                    <!--FOR PRODUTOS-->
                    <% }} %>
                    <!--FOR PRODUTOS-->

                </div>

            </div>

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
    <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule="" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.js"></script>
    <script src="js/main.js"></script>
    <script src="js/payment.js"></script>
    <!--Arquivos JS-->

</body>

</html>