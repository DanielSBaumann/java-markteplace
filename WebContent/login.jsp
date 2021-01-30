<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/login.css" media="screen" />
    <title>Document</title>
</head>

<body>

    <!--LISTA PRODUTOS-->
    <% 
        String lista = null;
        try {
            lista = session.getAttribute("lista-produtos").toString();
        }catch(NullPointerException e){
            lista = "";
        }
    %>
    <!--LISTA PRODUTOS-->

    <header>
        <h1><strong>BMN</strong> Login &amp; Register Forms</h1>
        <div class="description">
            <p>
                This is a free responsive <strong>"login and register forms"</strong> template made with Bootstrap.
                Download it on <a href="https://github.com/DanielSBaumann" target="_blank"><strong>AZMIND</strong></a>,
                customize and use it as you like!
            </p>
        </div>
    </header>

    <section>

        <!--Primeira box-->
        <div class="container-1">

            <div class="box-1">
                <div class="box-1-text">
                    <div class="box-1-sub">
                        <h2>Login para nossa pagina</h2>
                        <p>Entre usando email e senha para se conectar </p>
                    </div>
                    <div class="box-1-key">
                        <i class="fa fa-key"></i>
                    </div>
                </div>

                <div class="box-1-submit">
                    <form id="form-lg">

                        <input type="hidden" name="lista-produtos-lg" value='<%=lista%>'>

                        <div class="btn-format" id="mail-lg">

                            <input type="text" placeholder="Email..." id="mail-login" name="mail-login">

                            <div class="check-ok" id="check-lg-mail">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-lg-mail">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-lg-mail">
                                Somente números, letras, ponto(.) e @!
                            </div>

                        </div>

                        <div class="btn-format" id="senha-lg">

                            <input type="password" placeholder="Senha..." id="senha-login" name="senha-login">

                            <div class="check-ok" id="check-lg-senha">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-lg-senha">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-lg-senha">
                                Senha invalida!
                            </div>

                            <div class="eye" id="eye-senha-lg">
                                <i class="fa fa-eye"></i>
                            </div>

                            <div class="close-eye" id="close-eye-senha-lg">
                                <i class="fa fa-eye-slash"></i>
                            </div>

                        </div>

                        <div>
                            <input type="button" value="Entrar!" id="btn-login">
                        </div>
                        <div class="align">
                            <label>
                                <input type="checkbox">
                                <span></span>
                            </label>
                            <p>Manter-me logado</p>

                            <div class="login-fail" id="login-error">

                                Nao foi possivel efetuar o login!

                                <input type="hidden" value='<%=request.getAttribute("fail")%>' id="fail-response">

                                <div class="login-fail-close" id="close-fail">
                                    <i class="fa fa-times"></i>
                                </div>

                            </div>

                        </div>

                        <input type="hidden" value="false" id="sign" name="sign">

                    </form>
                </div>
            </div>

            <div class="conect">
                <p>...ou entre com:</p>
                <div>
                    <div class="box-logos"><i class="fab fa-facebook-f"> Facebook</i></div>
                    <div class="box-logos"><i class="fab fa-twitter"> Twiter</i></div>
                    <div class="box-logos"><i class="fab fa-google"> Google Plus</i></div>
                </div>
            </div>

        </div>
        <!--Primeira box-->

        <div class="line-1">
            <!--linha horizontal mobile / vertical desktop-->
        </div>

        <!--Segunda box-->
        <div class="container-2">

            <div class="box-2">
                <div class="box-1-text">
                    <div class="box-1-sub">
                        <h2>Faca seu cadastro</h2>
                        <p>Preencha os campos abaixo para ter acesso imediato: </p>
                    </div>
                    <div class="box-1-key">
                        <i class="fa fa-pencil-alt"></i>
                    </div>
                </div>

                <div class="box-1-submit">
                    <form id="form-cad">

                        <input type="hidden" name="lista-produtos-cad" value='<%=lista%>'>

                        <div class="btn-format" id="nome-cad">

                            <input type="text" placeholder="Nome..." id="nome-cadastro" name="nome-cadastro">

                            <div class="check-ok" id="check-cad-nome">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cad-nome">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cad-nome">
                                Somente letras!
                            </div>

                        </div>

                        <div class="btn-format" id="mail-cad">

                            <input type="text" placeholder="Email..." id="mail-cadastro" name="mail-cadastro">

                            <div class="check-ok" id="check-cad-mail">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cad-mail">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cad-mail">
                                <p id="verifica-mail">Somente números, letras, ponto(.) e @!</p>
                            </div>

                        </div>

                        <div class="btn-format" id="senha-cad">

                            <input type="password" placeholder="Senha..." id="senha-cadastro" name="senha-cadastro">

                            <div class="check-ok" id="check-cad-senha">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cad-senha">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cad-senha">
                                Senha invalida!
                            </div>

                            <div class="eye" id="eye-senha-cad">
                                <i class="fa fa-eye"></i>
                            </div>

                            <div class="close-eye" id="close-eye-senha-cad">
                                <i class="fa fa-eye-slash"></i>
                            </div>

                        </div>

                        <div class="btn-format" id="RPTsenha-cad">

                            <input type="password" placeholder="Repetir senha..." id="RPTsenha-cadastro"
                                name="RPTsenha-cadastro">

                            <div class="check-ok" id="check-cad-RPTsenha">
                                <i class="fa fa-check"></i>
                            </div>

                            <div class="check-x" id="x-cad-RPTsenha">
                                <i class="fa fa-exclamation"></i>
                            </div>

                            <div class="error-box" id="eb-cad-RPTsenha">
                                Senha invalida/não correspondem!
                            </div>

                            <div class="eye" id="eye-RPTsenha-cad">
                                <i class="fa fa-eye"></i>
                            </div>

                            <div class="close-eye" id="close-eye-RPTsenha-cad">
                                <i class="fa fa-eye-slash"></i>
                            </div>

                        </div>

                        <input type="button" value="Cadastrar" id="btn-cadastro">

                        <div class="result-cad">
                            <input type="text" value='<%=request.getAttribute("check")%>' id="confere-cadastro">
                        </div>

                    </form>
                </div>
            </div>

        </div>
        <!--Segunda box-->

    </section>

    <footer>
        <div class="line-2">
            <!--Segunda linha horizontal antes do footer-->
        </div>
        <p>Desenvolvido por <a href="#">Daniel Baumann</a></p>
    </footer>

    <!--Arquivos JS-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/login.js"></script>
    <!--Arquivos JS-->

</body>

</html>