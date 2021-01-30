/*###########################################*/
/*#####             Login               #####*/
/*###########################################*/
/*Fail Response*/
let fail = $("#fail-response").val();
if (fail == "erro") {
    $("#login-error").css('color', 'red');
} else {
    $("#login-error").css('color', 'rgb(235, 228, 228)');
}
/*Close Fail*/
$("#close-fail").click(function () { $("#login-error").css('color', 'rgb(235, 228, 228)'); });
/*Fail Response*/

/*Email Login*/
let emailLG = false;
$("#mail-login").focusout(function () {
    let aux = $('#mail-login').val();
    if (aux.match(/^[a-zA-Z0-9@.]+$/)) {
        $("#mail-lg").css('border-color', 'rgb(204, 199, 199)');
        $("#x-lg-mail").css('display', 'none');
        $("#check-lg-mail").css('color', 'lightgreen');
        emailLG = true;
    } else {
        $("#check-lg-mail").css('color', 'transparent');
        $("#mail-lg").css('border-color', 'red');
        $("#x-lg-mail").css('display', 'block');
        emailLG = false;
    }
});
/*ERROR BOX*/
$("#x-lg-mail").mouseenter(function () {
    $("#eb-lg-mail").css('display', 'block');
});
$("#x-lg-mail").mouseleave(function () {
    $("#eb-lg-mail").css('display', 'none');
});
/*Email Login*/

/*Senha Login*/
let senhaLG = false;
$("#senha-login").focusout(function () {
    let aux = $('#senha-login').val();
    if (aux.match(/^[a-zA-Z0-9]+$/)) {
        $("#senha-lg").css('border-color', 'rgb(204, 199, 199)');
        $("#x-lg-senha").css('display', 'none');
        $("#check-lg-senha").css('color', 'lightgreen');
        senhaLG = true;
    } else {
        $("#check-lg-senha").css('color', 'transparent');
        $("#senha-lg").css('border-color', 'red');
        $("#x-lg-senha").css('display', 'block');
        senhaLG = false;
    }
});
/*ERROR BOX*/
$("#x-lg-senha").mouseenter(function () {
    $("#eb-lg-senha").css('display', 'block');
});
$("#x-lg-senha").mouseleave(function () {
    $("#eb-lg-senha").css('display', 'none');
});
/*See Password*/
$("#eye-senha-lg").click(function () {
    $("#eye-senha-lg").css('display', 'none');
    $("#close-eye-senha-lg").css('display', 'block');
    $('#senha-login').prop('type', 'text');
});
/*Don't see*/
$("#close-eye-senha-lg").click(function () {
    $("#close-eye-senha-lg").css('display', 'none');
    $("#eye-senha-lg").css('display', 'block');
    $('#senha-login').prop('type', 'password');
});
/*Senha Login*/

//Permanecer logado
let sign = false;
$('input[type="checkbox"]').change(function () {
    sign ? sign = false : sign = true;
});
//Permanecer logado

/*BTN Login*/
$("#btn-login").click(function () {
    if (emailLG && senhaLG) {
        if(sign){
            $("#sign").val("true");
        }
        let aux = document.getElementById("form-lg");
        aux.action = "ServLogin";
        aux.method = "POST";
        aux.submit();
    }
});
/*BTN Login*/
/*###########################################*/
/*#####             Login               #####*/
/*###########################################*/

/*###########################################*/
/*#####             Cadastro            #####*/
/*###########################################*/
/*Nome Cadastro*/
let nomeCAD = false;
$("#nome-cadastro").focusout(function () {
    let aux = $('#nome-cadastro').val();
    if (aux.match(/^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/)) {
        $("#nome-cad").css('border-color', 'rgb(204, 199, 199)');
        $("#x-cad-nome").css('display', 'none');
        $("#check-cad-nome").css('color', 'lightgreen');
        nomeCAD = true;
    } else {
        $("#check-cad-nome").css('color', 'transparent');
        $("#nome-cad").css('border-color', 'red');
        $("#x-cad-nome").css('display', 'block');
        nomeCAD = false;
    }
});

console.log();
/*ERROR BOX*/
$("#x-cad-nome").mouseenter(function () {
    $("#eb-cad-nome").css('display', 'block');
});
$("#x-cad-nome").mouseleave(function () {
    $("#eb-cad-nome").css('display', 'none');
});
/*Nome Cadastro*/

/*Email Cadastro*/
let mailCAD = false;
let verificaMail = false;
$("#mail-cadastro").focusout(function () {

    //AJAX VERIFICAR EMAIL
    $.ajax({
        url: 'ServAjax',
        type: 'POST',
        data: { email: $("#mail-cadastro").val() },
        success: function (responseText) {
            let aux = responseText;
            if (aux == "ok") {
                verificaMail = true;

                //teste
                let aux2 = $('#mail-cadastro').val();
                if (aux2.match(/^[a-zA-Z0-9@.]+$/) && verificaMail) {
                    $("#mail-cad").css('border-color', 'rgb(204, 199, 199)');
                    $("#x-cad-mail").css('display', 'none');
                    $("#check-cad-mail").css('color', 'lightgreen');
                    mailCAD = true;
                } else {
                    $("#check-cad-mail").css('color', 'transparent');
                    $("#mail-cad").css('border-color', 'red');
                    $("#x-cad-mail").css('display', 'block');
                    mailCAD = false;
                }
                //teste

            } else {
                verificaMail = false;
                //teste
                $("#check-cad-mail").css('color', 'transparent');
                $("#mail-cad").css('border-color', 'red');
                $("#x-cad-mail").css('display', 'block');
                mailCAD = false;
                //teste
            }
        },
        error: function () {
            verificaMail = false;
        }
    });
    //AJAX VERIFICAR EMAIL
});
/*ERROR BOX*/
$("#x-cad-mail").mouseenter(function () {
    $("#eb-cad-mail").css('display', 'block');
});
$("#x-cad-mail").mouseleave(function () {
    $("#eb-cad-mail").css('display', 'none');
});
/*Email Cadastro*/

/*Senha Cadastro*/
let senhaCAD = false;
$("#senha-cadastro").focusout(function () {
    let aux = $('#senha-cadastro').val();
    if (aux.match(/^[a-zA-Z0-9]+$/)) {
        $("#senha-cad").css('border-color', 'rgb(204, 199, 199)');
        $("#x-cad-senha").css('display', 'none');
        $("#check-cad-senha").css('color', 'lightgreen');
        senhaCAD = true;
    } else {
        $("#check-cad-senha").css('color', 'transparent');
        $("#senha-cad").css('border-color', 'red');
        $("#x-cad-senha").css('display', 'block');
        senhaCAD = false;
    }
});
/*ERROR BOX*/
$("#x-cad-senha").mouseenter(function () {
    $("#eb-cad-senha").css('display', 'block');
});
$("#x-cad-senha").mouseleave(function () {
    $("#eb-cad-senha").css('display', 'none');
});
/*See Password*/
$("#eye-senha-cad").click(function () {
    $("#eye-senha-cad").css('display', 'none');
    $("#close-eye-senha-cad").css('display', 'block');
    $('#senha-cadastro').prop('type', 'text');
});
/*Don't see*/
$("#close-eye-senha-cad").click(function () {
    $("#close-eye-senha-cad").css('display', 'none');
    $("#eye-senha-cad").css('display', 'block');
    $('#senha-cadastro').prop('type', 'password');
});
/*Senha Cadastro*/

/*Repetir Senha Cadastro*/
let RPTsenhaCAD = false;
$("#RPTsenha-cadastro").focusout(function () {
    let aux = $('#RPTsenha-cadastro').val();
    if (aux.match(/^[a-zA-Z0-9]+$/) && aux === $('#senha-cadastro').val()) {
        $("#RPTsenha-cad").css('border-color', 'rgb(204, 199, 199)');
        $("#x-cad-RPTsenha").css('display', 'none');
        $("#check-cad-RPTsenha").css('color', 'lightgreen');
        RPTsenhaCAD = true;
    } else {
        $("#check-cad-RPTsenha").css('color', 'transparent');
        $("#RPTsenha-cad").css('border-color', 'red');
        $("#x-cad-RPTsenha").css('display', 'block');
        RPTsenhaCAD = false;
    }
});
/*ERROR BOX*/
$("#x-cad-RPTsenha").mouseenter(function () {
    $("#eb-cad-RPTsenha").css('display', 'block');
});
$("#x-cad-RPTsenha").mouseleave(function () {
    $("#eb-cad-RPTsenha").css('display', 'none');
});
/*See Password*/
$("#eye-RPTsenha-cad").click(function () {
    $("#eye-RPTsenha-cad").css('display', 'none');
    $("#close-eye-RPTsenha-cad").css('display', 'block');
    $('#RPTsenha-cadastro').prop('type', 'text');
});
/*Don't see*/
$("#close-eye-RPTsenha-cad").click(function () {
    $("#close-eye-RPTsenha-cad").css('display', 'none');
    $("#eye-RPTsenha-cad").css('display', 'block');
    $('#RPTsenha-cadastro').prop('type', 'password');
});
/*Repetir Senha Cadastro*/

/*BTN Cadastro*/
$("#btn-cadastro").click(function () {
    if (nomeCAD && mailCAD && senhaCAD && RPTsenhaCAD) {
        let aux = document.getElementById("form-cad");
        aux.action = "ServUser";
        aux.method = "POST";
        aux.submit();
    }
});
/*BTN Cadastro*/
/*Check Cadastro*/
let check = $("#confere-cadastro").val();
if (check == "null") {
    $("#confere-cadastro").css('color', 'transparent');
} else if (check == "Cadastro adcionado com sucesso!") {
    $("#confere-cadastro").css('color', 'lightgreen');
} else {
    $("#confere-cadastro").css('color', 'red');
}
/*Check Cadastro*/
/*###########################################*/
/*#####             Cadastro            #####*/
/*###########################################*/