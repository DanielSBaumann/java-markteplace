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
            if(idUser > 0){
                user = new Usuario().user(Long.parseLong(session.getAttribute("user-id").toString()));
            }else{
                %><script>getOut();</script><% 
            }  
        }catch(NullPointerException e){
            user = new Usuario(-2,"usuario");
            %><script>setId();</script><%
            %><script>getOut();</script><%
        }
    %>
        <!--OBJETO USER-->

        <!--TRANSACTION-->
        <input type="hidden" id="transaction" name="transaction" value='<%=session.getAttribute("transaction")%>'>
        <!--TRANSACTION-->

    </form>
    <!--MAIN FORM-->

    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->
    <%if(user.getId() > -2){%>
    <!--IF PARA ENVIAR AO LOGIN CASO A PAGE TFOR ACESSADA SEM TER ID PRODUTO-->
    
    <div class="main-error">
        <div class="me-title">
            <h1>BMN <ion-icon name="storefront-outline"></ion-icon>
            </h1>
            <p id="msg-1">Processando pagamento</p>
            <p id="msg-2">Parabens, compra Aprovada!</p>
            <p id="msg-3">Sua compra nao foi aprovada!</p>
            <p id="msg-4">Entre em contato com a operadora do cartao!</p>
        </div>
        <div class="align-spin"  id="spin">
            <div class="spinner"></div>
        </div>
        <div id="confirm">
            <input type="button" id="btn-ok" value="Ok">
            <p id="msg-5">Retornar para o menu principal</p>
            <p id="msg-6">Retornar para pagina de pagamento</p>
        </div>
    </div>

    <script>

        $("#msg-2").css('display', 'none');
        $("#msg-3").css('display', 'none');
        $("#msg-4").css('display', 'none');
        $("#msg-5").css('display', 'none');
        $("#msg-6").css('display', 'none');
        $("#confirm").css('display', 'none');

        setTimeout(function () {
        let aux = $("#transaction").val();
            if (aux == 'true') {
                $("#spin").css('display', 'none');
                $("#confirm").css('display', 'block');
                $("#msg-1").css('display', 'none');
                $("#msg-2").css('display', 'block');
                $("#msg-5").css('display', 'block');
            } else {
                $("#spin").css('display', 'none');
                $("#confirm").css('display', 'block');
                $("#msg-1").css('display', 'none');
                $("#msg-3").css('display', 'block');
                $("#msg-4").css('display', 'block');
                $("#msg-6").css('display', 'block');
            }
        }, 2000);

        $("#btn-ok").click(function(){
            let aux = $("#transaction").val();
            if(aux == 'true'){
                let out = document.getElementById("main-form");
                out.action = "ServHome";
                out.method = "POST";
                out.submit();
            }else{
                let out = document.getElementById("main-form");
                out.action = "ServPayment";
                out.method = "POST";
                out.submit();
            }
        });

    </script>

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