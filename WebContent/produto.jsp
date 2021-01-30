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
    <link rel="stylesheet" type="text/css" href="css/produtos.css" media="screen" />
    <title>Main</title>
</head>

<body>

    <!--MAIN FORM-->
    <form id="main-form">

        <!--OBJETO USER-->
        <input type="hidden" id="user" name="user">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
        <script src="js/user.js" type="text/javascript"></script>
            <% 
                Usuario user = null;
                List<Produto>list = null;
                try {
                    long idUser = Long.parseLong(session.getAttribute("user-id").toString());
                    if(idUser > 0){
                        user = new Usuario().user(idUser);
                        list = new Produto().list(user.getId());
                        %><input type="hidden" id="lista-produtos" name="lista-produtos" value='<%=session.getAttribute("lista-produtos").toString()%>'><%
                    }  
                }catch(NullPointerException e){
                    user = new Usuario(-2,"usuario");
                    %><script>setId();</script><%
                    %><script>getOut();</script><%
                }
            %>
            <!--OBJETO USER-->

        <!--ID MEU PRODUTO-->
        <input type="hidden" id="id-prod" name="id-prod">
        <!--ID MEU PRODUTO-->

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

        <!--CADASTRO DE PRODUTOS-->
        <div class="container-2">

            <!--FORM CADASTRO-->
            <form id="form-cad">
                <!--FORM CADASTRO-->

                <div class="box-5">
                    <div class="box-1-text">
                        <div class="box-1-sub">
                            <h2>Produtos</h2>
                            <p>Atualize e cadastre aqui os dados de seus produtos</p>
                        </div>
                        <div class="box-1-key">
                            <i class="fa fa-store"></i>
                        </div>
                    </div>

                    <div class="box-1-submit">

                        <div class="btn-format" id="nome">

                            <input type="text" placeholder="Nome..." id="" name="nome-produto">

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

                        <div class="btn-format" id="descricao">

                            <input type="text" placeholder="Descricao..." id="" name="descricao-produto">

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

                        <div class="btn-format" id="marca">

                            <input type="text" placeholder="Marca..." id="" name="marca-produto">

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

                        <div class="btn-format" id="categoria">

                            <input type="text" placeholder="Categoria..." list="categorias" id="" maxlength="11"
                                name="categoria-produto">

                            <datalist id="categorias">
                                <option value="Eletronicos">
                                <option value="Acessorios">
                                <option value="Fashion">
                                <option value="Infantil">
                                <option value="Esportes"></option>
                                <option value="Livros"></option>
                            </datalist>

                            <div class="check-ok" id="check-uf">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-uf">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-uf">
                                Estado nao cadastrado!
                            </div>

                        </div>

                        <div class="btn-format" id="preco">

                            <input type="text" placeholder="Preco..." id="" name="preco-produto">

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

                        <div class="btn-format" id="quantidade">

                            <input type="text" placeholder="Quantidade..." list="quantidades" id="" maxlength="2"
                                name="quantidade-produto">

                            <datalist id="quantidades">
                                <option value="1"></option>
                                <option value="2"></option>
                                <option value="3"></option>
                                <option value="4"></option>
                                <option value="5"></option>
                                <option value="6"></option>
                                <option value="7"></option>
                                <option value="8"></option>
                                <option value="9"></option>
                                <option value="10"></option>
                                <option value="11"></option>
                                <option value="12"></option>
                                <option value="13"></option>
                                <option value="14"></option>
                                <option value="15"></option>
                                <option value="16"></option>
                                <option value="17"></option>
                                <option value="18"></option>
                                <option value="19"></option>
                                <option value="20"></option>
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

                        <!--SELETOR DE IMAGENS-->
                        <div class="select">

                            <div class="select-box" id="sb-1">

                                <div class="select-box-interno">

                                    <label for='real-input-1'>

                                        <i class="fa fa-file-image"></i>

                                        <div class="select-box-img" id="box-img-1">
                                            <img src="" alt="#" id="img-1">
                                        </div>

                                    </label>

                                    <div class="select-box-txt" id="sb-txt-1">
                                        <p>Imagem 1</p>
                                    </div>

                                    <div class="select-box-close" id="sb-close-1">
                                        <i class="fa fa-times"></i>
                                    </div>

                                    <input type='file' accept='image/*' id='real-input-1' name="imagem-produto-1" />

                                </div>

                            </div>

                            <div class="select-box" id="sb-2">

                                <div class="select-box-interno">

                                    <label for='real-input-2'>

                                        <i class="fa fa-file-image"></i>

                                        <div class="select-box-img" id="box-img-2">
                                            <img src="" alt="#" id="img-2">
                                        </div>

                                    </label>

                                    <div class="select-box-txt" id="sb-txt-2">
                                        <p>Imagem 2</p>
                                    </div>

                                    <div class="select-box-close" id="sb-close-2">
                                        <i class="fa fa-times"></i>
                                    </div>

                                    <input type='file' accept='image/*' id='real-input-2' name="imagem-produto-2" />

                                </div>

                            </div>

                            <div class="select-box" id="sb-3">

                                <div class="select-box-interno">

                                    <label for='real-input-3'>

                                        <i class="fa fa-file-image"></i>

                                        <div class="select-box-img" id="box-img-3">
                                            <img src="" alt="#" id="img-3">
                                        </div>

                                    </label>

                                    <div class="select-box-txt" id="sb-txt-3">
                                        <p>Imagem 3</p>
                                    </div>

                                    <div class="select-box-close" id="sb-close-3">
                                        <i class="fa fa-times"></i>
                                    </div>

                                    <input type='file' accept='image/*' id='real-input-3' name="imagem-produto-3" />

                                </div>

                            </div>

                            <div class="select-box" id="sb-4">

                                <div class="select-box-interno">

                                    <label for='real-input-4'>

                                        <i class="fa fa-file-image"></i>

                                        <div class="select-box-img" id="box-img-4">
                                            <img src="" alt="#" id="img-4">
                                        </div>

                                    </label>

                                    <div class="select-box-txt" id="sb-txt-4">
                                        <p>Imagem 4</p>
                                    </div>

                                    <div class="select-box-close" id="sb-close-4">
                                        <i class="fa fa-times"></i>
                                    </div>

                                    <input type='file' accept='image/*' id='real-input-4' name="imagem-produto-4" />

                                </div>

                            </div>

                        </div>
                        <!--SELETOR DE IMAGENS-->

                        <div>
                            <input type="button" value="Cadastrar..." id="cadastrar-produto">
                        </div>
                    </div>
                </div>

                <!--FORM CADASTRO-->
            </form>
            <!--FORM CADASTRO-->

        </div>
        <!--CADASTRO DE PRODUTOS-->

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
            <%for(Produto p : list){ %>
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
                    <p>R$<%=p.getPreco()%></p>
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
            <% }} %>
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

    <!--Arquivos JS-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/main.js"></script>
    <script src="js/produtos.js"></script>
    <!--Arquivos JS-->

</body>

</html>