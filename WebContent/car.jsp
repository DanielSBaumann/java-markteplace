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
    <link rel="stylesheet" type="text/css" href="css/car.css" media="screen" />
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
                    user = new Usuario(-2,"usuario");
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

        <div class="kart">
            
            <div class="kart-display" id="kart-display">

                <!--MONTANDO DISPLAY CARRINHO-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
                <script>
                    
                    let lista = JSON.parse($("#lista-produtos").val());
                    let num = 1;
                    let subtotal = 0;

                    for (let produto of lista) {
                        let div =   '<div class=\"kart-display-box\">'+
                                        '<div class=\"kart-dp-top\">'+
                                            '<div class=\"kart-dp-img\">'+
                                                '<img src=\"' + produto.imagem + '\" alt=\"#\">' +
                                            '</div>'+
                                            '<div class=\"kart-dp-info\">'+
                                                '<p>' + produto.nome + '</p>'+
                                                '<p>Anunciante: <a href=\"#\">' + produto.anunciante + '</a></p>'+
                                            '</div>'+
                                            '<div class=\"kart-dp-trash\" id="trash-' + num + '">'+
                                                '<ion-icon name=\"trash-outline\"></ion-icon>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class=\"kart-dp-bottom\">'+
                                            '<div class=\"price-1\">' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                            '<div class="action-box">'+
                                                '<div class="kart-symbol-minus" id="minus-' + num + '">'+
                                                    '<i class="fa fa-minus"></i>'+
                                                '</div>'+
                                                '<div class="kart-symbol-num">'+
                                                   '<input type="text" class="dp-number" value="' + produto.qtd + '" id="number-' + num + '" disabled>'+
                                                '</div>'+
                                                '<div class="kart-symbol-plus" id="plus-' + num + '">'+
                                                    '<i class="fa fa-plus"></i>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="price-2">' + parseFloat(produto.precoFinal * produto.qtd).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                            '<div class="bottom-line"></div>'+
                                        '</div>'+
                                    '</div>'+
                                    '<script>'+
                                        '$("#minus-' + num + '").click(function(){'+
                                            'let aux = parseFloat($("#number-' + num + '").val());'+
                                            'if(aux > 0){'+
                                                '$("#number-' + num + '").val(aux - 1);'+
                                            '}'+
                                        '});'+
                                        '$("#plus-' + num + '").click(function(){'+
                                            'let aux = parseFloat($("#number-' + num + '").val());'+
                                            'if(aux < ' + produto.qtdEstoque + '){'+
                                                '$("#number-' + num + '").val(aux + 1);'+
                                            '}'+
                                        '});'+
                                        '$("#trash-' + num + '").click(function(){'+
                                          'removeKart(' + parseFloat(num - 1)  + ');'+
                                          'build(' + parseFloat(num - 1)  + ');'+
                                        '});';
                        subtotal += parseFloat(produto.precoFinal * produto.qtd);
                        num++;
                        $("#kart-display").append(div);
                    }
                    
                    function build(ind){
                        $("#kart-display div").remove();
                        lista.splice(ind, 1);
                        num = 1;
                        subtotal = 0;
                        for (let produto of lista) {
                            let div =   '<div class=\"kart-display-box\">'+
                                            '<div class=\"kart-dp-top\">'+
                                                '<div class=\"kart-dp-img\">'+
                                                    '<img src=\"' + produto.imagem + '\" alt=\"#\">' +
                                                '</div>'+
                                                '<div class=\"kart-dp-info\">'+
                                                    '<p>' + produto.nome + '</p>'+
                                                    '<p>Anunciante: <a href=\"#\">' + produto.anunciante + '</a></p>'+
                                                '</div>'+
                                                '<div class=\"kart-dp-trash\" id="trash-' + num + '">'+
                                                    '<ion-icon name=\"trash-outline\"></ion-icon>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class=\"kart-dp-bottom\">'+
                                                '<div class=\"price-1\">' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                                '<div class="action-box">'+
                                                    '<div class="kart-symbol-minus" id="minus-' + num + '">'+
                                                        '<i class="fa fa-minus"></i>'+
                                                    '</div>'+
                                                    '<div class="kart-symbol-num">'+
                                                       '<input type="text" class="dp-number" value="' + produto.qtd + '" id="number-' + num + '" disabled>'+
                                                    '</div>'+
                                                    '<div class="kart-symbol-plus" id="plus-' + num + '">'+
                                                        '<i class="fa fa-plus"></i>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="price-2">' + parseFloat(produto.precoFinal * produto.qtd).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                                '<div class="bottom-line"></div>'+
                                            '</div>'+
                                        '</div>'+
                                        '<script>'+
                                            '$("#minus-' + num + '").click(function(){'+
                                                'let aux = parseFloat($("#number-' + num + '").val());'+
                                                'if(aux > 0){'+
                                                    '$("#number-' + num + '").val(aux - 1);'+
                                                '}'+
                                            '});'+
                                            '$("#plus-' + num + '").click(function(){'+
                                                'let aux = parseFloat($("#number-' + num + '").val());'+
                                                'if(aux < ' + produto.qtdEstoque + '){'+
                                                    '$("#number-' + num + '").val(aux + 1);'+
                                                '}'+
                                            '});'+
                                            '$("#trash-' + num + '").click(function(){'+
                                              'removeKart(' + parseFloat(num - 1)  + ');'+
                                              'build(' + parseFloat(num - 1)  + ')'+
                                            '});';
                            subtotal += parseFloat(produto.precoFinal * produto.qtd);
                            num++;
                            $("#kart-display").append(div);
                        } 
                        $("#final-price").html(subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })); 
                    }

                    function rebuild(){
                        num = 1;
                        subtotal = 0;
                        for (let produto of lista) {
                            let div =   '<div class=\"kart-display-box\">'+
                                            '<div class=\"kart-dp-top\">'+
                                                '<div class=\"kart-dp-img\">'+
                                                    '<img src=\"' + produto.imagem + '\" alt=\"#\">' +
                                                '</div>'+
                                                '<div class=\"kart-dp-info\">'+
                                                    '<p>' + produto.nome + '</p>'+
                                                    '<p>Anunciante: <a href=\"#\">' + produto.anunciante + '</a></p>'+
                                                '</div>'+
                                                '<div class=\"kart-dp-trash\" id="trash-' + num + '">'+
                                                    '<ion-icon name=\"trash-outline\"></ion-icon>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class=\"kart-dp-bottom\">'+
                                                '<div class=\"price-1\">' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                                '<div class="action-box">'+
                                                    '<div class="kart-symbol-minus" id="minus-' + num + '">'+
                                                        '<i class="fa fa-minus"></i>'+
                                                    '</div>'+
                                                    '<div class="kart-symbol-num">'+
                                                       '<input type="text" class="dp-number" value="' + produto.qtd + '" id="number-' + num + '" disabled>'+
                                                    '</div>'+
                                                    '<div class="kart-symbol-plus" id="plus-' + num + '">'+
                                                        '<i class="fa fa-plus"></i>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="price-2">' + parseFloat(produto.precoFinal * produto.qtd).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</div>'+
                                                '<div class="bottom-line"></div>'+
                                            '</div>'+
                                        '</div>'+
                                        '<script>'+
                                            '$("#minus-' + num + '").click(function(){'+
                                                'let aux = parseFloat($("#number-' + num + '").val());'+
                                                'if(aux > 0){'+
                                                    '$("#number-' + num + '").val(aux - 1);'+
                                                '}'+
                                            '});'+
                                            '$("#plus-' + num + '").click(function(){'+
                                                'let aux = parseFloat($("#number-' + num + '").val());'+
                                                'if(aux < ' + produto.qtdEstoque + '){'+
                                                    '$("#number-' + num + '").val(aux + 1);'+
                                                '}'+
                                            '});'+
                                            '$("#trash-' + num + '").click(function(){'+
                                              'removeKart(' + parseFloat(num - 1)  + ');'+
                                              'build(' + parseFloat(num - 1)  + ')'+
                                            '});';
                            subtotal += parseFloat(produto.precoFinal * produto.qtd);
                            num++;
                            $("#kart-display").append(div);
                        } 
                        $("#final-price").html(subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })); 
                    }

                    function cleanList(){
                        let cont = 0;
                        for (var i = 0; i < lista.length; i++) {
                            if (lista[i].qtd == "0") {
                                lista.splice(i, 1);
                            }
                        }
                    }

                    function cleanDiv() {
                        $("#car-display div").remove();
                        $("#qtd-car").val(lista.length);
                        $("#kart-display div").remove();
                        $("#lista-produtos").val(lista);
                    }
                    
                   </script>
                <!--MONTANDO DISPLAY CARRINHO-->

                    <!--Remontar page apos alterar no carrinho aside-->
                <input type="hidden" id="build" value="">
                <input type="hidden" id="trash" value="false">
                <script>
                    $("#build").bind("change", function () {
                            let aux = $("#build").val();
                            build(parseFloat(aux));
                    });
                </script>
                    <!--Remontar page apos alterar no carrinho aside-->
        
            </div>

            <div class="kart-sign">
                <div id="kart-home">
                    <ion-icon name="arrow-back-outline"></ion-icon>
                    <p>Continuar comprando</p>
                </div>
                <div id="update-kart">
                    <p>Atualizar carrinho</p>
                    <ion-icon name="refresh-outline"></ion-icon>
                </div>

                <script>
                    //Alterar valores apos update da pagina
                    $("#update-kart").click(function () {
                        let cont = 1;
                        for (let produto of lista) {
                            produto.qtd = $("#number-" + cont).val();
                            cont++;
                        }
                        cleanList();
                        cleanDiv();
                        rebuild();
                        displayMany(lista);
                        updateList(lista);
                    });
                </script>

            </div>

            <div class="kart-sub">
            
                <div class="kart-sub-box">

                    <div>
                        <h4>Total do carrinho <ion-icon name="cart-outline"></ion-icon>
                        </h4>
                    </div>

                    <div>
                        <p>Total:</p>
                        <p id="final-price">sub</p>
                    </div>

                    <script>
                       $("#final-price").html(subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));  
                    </script>

                    <div>
                        <input type="button" class="btn-compra" id="kart-payment" value="Finalizar Compra">
                    </div>
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
    <!--Arquivos JS-->

</body>

</html>