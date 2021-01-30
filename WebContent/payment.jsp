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
    <link rel="stylesheet" type="text/css" href="css/payment.css" media="screen" />
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

        <!--ENDERECO-->
        <input type="hidden" id="main-cep" name="main-cep" value='<%=user.getCep()%>'>
        <input type="hidden" id="main-uf" name="main-uf" value='<%=user.getUf()%>'>
        <input type="hidden" id="main-cidade" name="main-cidade" value='<%=user.getCidade()%>'>
        <input type="hidden" id="main-endereco" name="main-endereco" value='<%=user.getEndereco()%>'>
        <input type="hidden" id="main-numero" name="main-numero" value='<%=user.getNumeroEndereco()%>'>
        <input type="hidden" id="main-complemento" name="main-complemento" value='<%=user.getComplemento()%>'>
        <!--ENDERECO-->

        <!--CARD INFO-->
        <input type="hidden" id="main-titular" name="main-titular" >
        <input type="hidden" id="main-card" name="main-card" >
        <input type="hidden" id="main-mes" name="main-mes" >
        <input type="hidden" id="main-ano" name="main-ano" >
        <input type="hidden" id="main-sec" name="main-sec" >
        <input type="hidden" id="main-flag" name="main-flag" >
        <!--CARD INFO-->

    </form>
    <!--MAIN FORM-->

    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->
    <%if(user.getId() > -2){%>
    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->

    <div class="main-error" id="display-time">
        <div class="me-title">
            <h1>BMN <ion-icon name="storefront-outline"></ion-icon>
            </h1>
            <p>Processando pagamento</p>
        </div>
        <div class="align-spin">
            <div class="spinner"></div>
        </div>
    </div>

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

        <div class="pay">

            <div class="pay-prod">

                <div class="pay-prod-title">
                    <div>
                        <p><strong>Produto</strong></p>
                    </div>
                    <div>
                        <p><strong>Subtotal</strong></p>
                    </div>
                </div>

                <div id="pay-produto">

                    <!--LISTA PRODUTOS PAYMENT-->
                    <input type="hidden" id="lista-pagamento">
                    <input type="hidden" id="build" value="">
                    <!--LISTA PRODUTOS PAYMENT-->
                
                </div>

                <div class="ppa-sub">
                    <p><strong>Total:</strong></p>
                    <p><strong id="total-view"></strong></p>
                </div>

                <!--MONTANDO DISPLAY PAGAMENTO-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
                <script>
                
                    let lista = JSON.parse($("#lista-produtos").val());
                    let subtotal = 0;
                
                    for (let produto of lista) {
                
                        let div = '<div class=\"pay-prod-box\">'+     
                                        '<div class=\"ppb-prod\">'+
                                            '<div class=\"ppb-prod-img\">'+
                                                '<img src=\"' + produto.imagem + '\" alt=\"' + produto.nome + '\">'+
                                            '</div>'+
                                            '<div class=\"ppb-prod-info\">'+
                                                '<p><strong>' + produto.nome + '</strong></p>'+
                                                '<p>(x' + produto.qtd + ')</p>'+
                                                '<p>Anunciante: <a onclick="pageVendor(\'' + produto.id + '\',\'' + produto.anunciante + '\')">' + produto.anunciante + '</a></p>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class=\"ppb-price\">'+
                                            '<p><strong>' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</strong></p>'+
                                        '</div>'+
                                    '</div>';
                        subtotal += parseFloat(produto.precoFinal * produto.qtd);
                        $("#pay-produto").append(div);
                    }

                    $("#total-view").html(subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
                
                    function build(){
                
                        subtotal = 0;
                        lista = JSON.parse($("#lista-pagamento").val());
                        $("#pay-produto div").remove();
                
                        for (let produto of lista) {
                
                            let div = '<div class=\"pay-prod-box\">'+     
                                            '<div class=\"ppb-prod\">'+
                                                '<div class=\"ppb-prod-img\">'+
                                                    '<img src=\"' + produto.imagem + '\" alt=\"' + produto.nome + '\">'+
                                                '</div>'+
                                                '<div class=\"ppb-prod-info\">'+
                                                    '<p><strong>' + produto.nome + '</strong></p>'+
                                                    '<p>(x' + produto.qtd + ')</p>'+
                                                    '<p>Anunciante: <a onclick="pageVendor(\'' + produto.id + '\',\'' + produto.anunciante + '\')">' + produto.anunciante + '</a></p>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class=\"ppb-price\">'+
                                                '<p><strong>' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</strong></p>'+
                                            '</div>'+
                                        '</div>';
                            subtotal += parseFloat(produto.precoFinal * produto.qtd);
                            $("#pay-produto").append(div);
                            } 
                
                        }
                
                </script>
                <!--MONTANDO DISPLAY PAGAMENTO-->

                <!--Fazer logica para endereco-->
                <div class="pay-prod-address">
                
                    <div class="ppa-addres-exist" id="address-exist">

                        <div class="ae-top">
                            <div class="ae-top-title">
                                <p>Entrega:</p>
                            </div>
                            <div class="ae-top-info">
                                <p><strong>CEP: 22790-685</strong></p>
                                <p><strong>Rio de Janeiro , RJ</strong></p>
                                <p><strong>Rua Rivadavia Campos , 1000</strong></p>
                                <p><strong>Bloco 2 , Apartamento 213</strong></p>
                            </div>
                        </div>

                        <div class="ae-bottom">
                            <div id="ae-confirm">
                                <p>Confirma endereco de entrega?</p>
                                <input type="button" value="Sim" class="address-btn" id="ae-yes">
                                <input type="button" value="Nao" class="address-btn" id="ae-no">
                            </div>
                            <div id="ae-msg">
                                <p>Caso queira alterar o endereco , click <u id="reset-exist">aqui</u></p>
                            </div>
                        </div>

                    </div>
                
                    <div class="ppa-addres-inexist" id="address-inexist">

                        <div class="ae-top">

                            <div class="ae-top-title">
                                <p>Preencha seus dados de entrega:</p>
                            </div>

                            <div class="ai-top-info">

                                <div>
                                    <label for="cep">CEP:</label>
                                    <input type="text" id="cep" class="inpt-add"
                                        oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">

                                    <button id="btn-cep" class="msg-erro-cep">Cep invalido!</button>

                                </div>

                                <div id="exibir-endereco">

                                    <div>
                                        <label for="uf">Estado:</label>
                                        <input type="text" id="uf" class="inpt-add" style="width: 10%;" readonly>
                                    </div>

                                    <div>  
                                        <label for="cidade">Cidade:</label>
                                        <input type="text" id="cidade" class="inpt-add" style="width: 50%;" readonly>
                                    </div>

                                    <div>  
                                        <label for="endereco">Endereco:</label>
                                        <input type="text" id="endereco" class="inpt-add" style="width: 50%;" readonly>
                                    </div>

                                    <div>
                                        <label for="numero">N. :</label>
                                        <input type="text" id="numero" class="inpt-add" style="width: 14%;" readonly>

                                        <label for="comp">Complemento:</label>
                                        <input type="text" id="comp" class="inpt-add" style="width: 40%;" readonly>
                                    </div>

                                </div>
                                

                            </div>

                        </div>

                        <div class="ae-bottom">
                            <div id="ai-confirm">
                                <p>Confirma endereco de entrega?</p>
                                <input type="button" value="Sim" class="address-btn" id="ai-yes">
                                <input type="button" value="Não" class="address-btn" id="ai-no">
                            </div>
                        </div>

                    </div>
                
                    <div class="ppa-addres-filled" id="address-filled">

                        <div class="ae-top">
                            <div class="ae-top-title">
                                <p>Entrega:</p>
                            </div>
                            <div class="ae-top-info">
                                <p><strong id="cep-filled">CEP: 22790-685</strong></p>
                                <p><strong id="uf-filled">Rio de Janeiro , RJ</strong></p>
                                <p><strong id="num-filled">Rua Rivadavia Campos , 1000</strong></p>
                                <p><strong id="comp-filled">Bloco 2 , Apartamento 213</strong></p>
                            </div>
                        </div>

                        <div class="ae-bottom">

                            <div id="af-msg">
                                <p>Caso queira alterar o endereco , click <u id="reset-inexist">aqui</u></p>
                            </div>

                        </div>

                    </div>
                
                </div>

                <div class="pay-prod-card">

                    <!--Lista de cartoes aqui-->
                    <%List<CartaoUsuario> card = new CartaoUsuario().list(user.getId());%>
                        <!--Lista de cartoes aqui-->

                    <div class="ppc-title">
                        <p><strong>Informacoes de pagamento</strong></p>
                    </div>

                    <!--PARA LISTA VAZIA-->
                    <%if(card == null || card.isEmpty()){%>

                        <div class="credit-card-box">

                            <div class="ccb-top">
    
                                <div>
                                    <p><strong>Informacoes do cartao <i class="fa fa-credit-card"></i></strong></p>
                                </div>
    
                                <div>
                                    <label for="titular">Titular</label>
                                    <input type="text" id="titular" placeholder="Nome do titular..." oninput="this.value = this.value.replace(/[^a-zA-z %.]/g, '').replace(/(\..*)\./g, '$1');">
                                </div>
                            
                                <div>
                                
                                    <label for="num-cartao">N. Cartao</label>
                                    <input type="text" id="num-cartao" placeholder="0000 0000 0000 0000" maxlength="16" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                                
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

                        <div class="credit-card-box-2" id="box-2">
                    
                        <div class="card-filled">
                    
                            <div class="card-filled-box">
                    
                                <div class="cfb-img">
                                    <img src="img/<%=cr.getFlag()%>.jpg" alt="<%=cr.getFlag()%> logo">
                                </div>
                    
                                <div class="cfb-num">
                    
                                    <input type="password" value="1234" disabled>
                                    <input type="password" value="1234" disabled>
                                    <input type="password" value="1234" disabled>
                                    <input type="text" value="<%=finalNum%>" disabled>
                    
                                </div>
                    
                                <div class="cfb-date">
                                    <p>Validade <strong><%=cr.getMonth()%> / <%=cr.getYear()%></strong></p>
                                </div>
                    
                            </div>

                            <% String auxId = user.getNome().replace(" ","-");%>
                    
                            <div class="card-filled-info">
                                <label for="check-card">Utilizar cartao</label>
                                <input type="checkbox" id='<%=auxId%><%=user.getId()%>' 
                                onclick="cardInfo2(
                                    '<%=auxId%><%=user.getId()%>',
                                    '<%=user.getNome()%>',
                                    '<%=cr.getNum()%>',
                                    '<%=cr.getMonth()%>',
                                    '<%=cr.getYear()%>',
                                    '<%=cr.getSec()%>'
                                    )">
                            </div>
                    
                        </div>
                    
                        </div>

                        <div class="credit-card-box" id="box-1">

                        <div class="ccb-top">

                            <div>
                                <p><strong>Informacoes do cartao <i class="fa fa-credit-card"></i></strong></p>
                            </div>

                            <div>
                                <label for="titular">Titular</label>
                                <input type="text" id="titular" placeholder="Nome do titular..." oninput="this.value = this.value.replace(/[^a-zA-z %.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                        
                            <div>
                            
                                <label for="num-cartao">N. Cartao</label>
                                <input type="text" id="num-cartao" placeholder="0000 0000 0000 0000" maxlength="16" oninput="this.value = this.value.replace(/[^0-9%.]/g, '').replace(/(\..*)\./g, '$1');">
                            
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
                        <script>$("#box-1").css('display','none');</script>

                    <!--FOR PRODUTOS-->
                    <% }} %>
                    <!--FOR PRODUTOS-->

                    <div class="ppc-msg">

                        <p id="ppc-msg-1">Cartao verificado! <i class="fa fa-check"></i></p>

                        <p id="ppc-msg-2">Cartao invalido! <i class="fa fa-times"></i></p>

                        <p id="ppc-msg-3">Resetar informacoes <i class="fa fa-redo"></i></p>

                    </div>

                    <div class="ppc-final">

                        <div>
                            <p><strong id="final-price-bottom">Total:</strong></p>
                        </div>

                        <div>
                            <input type="button" id="btn-comprar" value="Comprar" class="btn-ppc">
                        </div>

                    </div>

                    <script>

                        $("#final-price-bottom").html('Total:' + subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));

                        $("#lista-pagamento").bind("change", function () {
                            build();
                            $("#total-view").html(subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
                            $("#final-price-bottom").html('Total:' + subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
                            if(subtotal == 0){
                                goHome();
                            }
                        });
                    </script>

                </div>

                <script>

                    let cep = $('#main-cep').val();
                    console.log('vendo cep -> ' + cep)
                    if (cep == 'null') {
                        $("#address-exist").css('display', 'none');
                        $("#address-inexist").css('display', 'block');
                    } else {
                        $("#address-exist").css('display', 'block');
                        $("#address-inexist").css('display', 'none');
                    }

                </script>

                <!--Fazer logica para endereco-->

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