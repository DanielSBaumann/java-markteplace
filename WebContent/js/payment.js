//display time exibir enquanto processa
$("#display-time").css('display', 'none');

//setando enderecos apos confirmar
function setAddress(cep, uf, cidade, endereco, numero, complemento) {
    $('#main-cep').val(cep);
    $('#main-uf').val(uf);
    $('#main-cidade').val(cidade);
    $('#main-endereco').val(endereco);
    $('#main-numero').val(numero);
    $('#main-complemento').val(complemento);
}

//resetar endereco
function cleanAddress() {
    $("#address-exist").css('display', 'none');
    $("#address-filled").css('display', 'none');
    $("#address-inexist").css('display', 'block');
    $("#ai-confirm").css('display', 'none');
    $('#cep').val('');
    $('#uf').val('');
    $('#cidade').val('');
    $('#endereco').val('');
    $('#numero').val('');
    $('#comp').val('');
    $('#numero').prop('readonly', true);
    $('#comp').prop('readonly', true);
}

let address = false;

$("#address-filled").css('display', 'none');
$("#btn-cep").css('display', 'none');

//###############################################################
//############       ENDERECO EXISTENTE      ####################
//###############################################################

//endereco existente
$("#ae-msg").css('display', 'none');

$("#ae-yes").click(function () {
    $("#ae-confirm").css('display', 'none');
    $("#ae-msg").css('display', 'block');
    address = true;
});

$("#ae-no").click(function () {
    cleanAddress();
    address = false;
});

//resetando tudo
$("#reset-exist").click(function () {
    cleanAddress();
    address = false;
});

//###############################################################
//############       ENDERECO EXISTENTE      ####################
//###############################################################

//###############################################################
//############       ENDERECO INEXISTENTE    ####################
//###############################################################

//caixa dialogo confirma endereco
$("#ai-confirm").css('display', 'none');

//cep
$("#cep").keyup(function () {
    let aux = $('#cep').val();
    if (aux.length == 8 && aux.match(/^[0-9]+$/)) {
        //API  CEP
        let xhr = new XMLHttpRequest();
        let endereco;
        xhr.open("GET", "http://cep.la/" + aux, true);
        xhr.setRequestHeader("Accept", "application/json");
        xhr.onreadystatechange = function () {
            if ((xhr.readyState == 0 || xhr.readyState == 4) && xhr.status == 200) {
                let endereco = JSON.parse(xhr.responseText);
                //uf
                $('#uf').val(endereco.uf);
                //cidade
                $('#cidade').val(endereco.cidade);
                //endereco
                $('#endereco').val(endereco.logradouro);
                //habilitando para editar
                $('#numero').prop('readonly', false);
                $('#comp').prop('readonly', false);

                if (endereco == '') {
                    $("#btn-cep").css('display', 'inline-block');
                } else {
                    $("#btn-cep").css('display', 'none');
                }

            } else {
                //cep invalido
                $("#btn-cep").css('display', 'inline-block');
                console.log("Not ok");
            }
        };
        xhr.send(null);
        //API  CEP
    } else {
        $("#btn-cep").css('display', 'inline-block');
        console.log("Not ok");
    }
});

let auxNum = false;
let auxComp = false;

//check numero
$('#numero').focusout(function () {
    let num = $('#numero').val();
    if (num.match(/^[0-9]+$/)) {
        auxNum = true;
    }
    if (auxNum && auxComp) {
        $("#ai-confirm").css('display', 'block');
    }
});

//check complemento
$('#comp').focusout(function () {
    let comp = $('#comp').val();
    if (comp.match(/^[a-zA-Z0-9 ]+$/)) {
        auxComp = true;
    }
    if (auxNum && auxComp) {
        $("#ai-confirm").css('display', 'block');
    }
});

//endereco preenchido e confirmado
$("#ai-yes").click(function () {

    let cep = $('#cep').val();
    let uf = $('#uf').val();
    let cidade = $('#cidade').val();
    let endereco = $('#endereco').val();
    let numero = $('#numero').val();
    let complemento = $('#comp').val();

    $("#address-inexist").css('display', 'none');

    $("#address-filled").css('display', 'block');

    $('#cep-filled').html('CEP: ' + cep);
    $('#uf-filled').html(cidade + ' , ' + uf);
    $('#num-filled').html(endereco + ' , ' + numero);
    $('#comp-filled').html(complemento);

    $("#af-msg").css('display', 'block');

    //setar endereco form-main
    setAddress(cep,uf,cidade,endereco,numero,complemento);
    address = true;
});
$("#ai-no").click(function () {
    cleanAddress();
    address = false;
});

//resetando tudo
$("#reset-inexist").click(function () {
    cleanAddress();
    address = false;
});

//###############################################################
//############       ENDERECO INEXISTENTE    ####################
//###############################################################

//###############################################################
//############       PAGAMENTO               ####################
//###############################################################

let bandeira = -1;
let cardValue = false;
let cardAccept = false;

$("#ppc-msg-1").css('display','none');
$("#ppc-msg-2").css('display','none');
$("#card-logo-1").css('display','none');
$("#card-logo-2").css('display','none');
$("#card-logo-3").css('display','none');
$("#card-logo-4").css('display','none');

function checkLuhn(value) {
    let sum = 0;
    let shouldDouble = false;
    for (let i = value.length - 1; i >= 0; i--) {
        let digit = parseInt(value.charAt(i));
        if (shouldDouble) {
            if ((digit *= 2) > 9) {
                digit -= 9;
            }
        }
        sum += digit;
        shouldDouble = !shouldDouble;
    }
    return (sum % 10) == 0;
}

/*
   CARTOES PARA TESTE
   '378282246310005',     // American Express
   '371449635398431',     // American Express
   '5078601870000127985', // Aura
   '5078601800003247449', // Aura
   '30569309025904',      // Diners Club
   '38520000023237',      // Diners Club
   '6011111111111117',    // Discover
   '6362970000457013',    // Elo
   '6062825624254001',    // Hipercard
   '5555555555554444',    // MasterCard
   '5105105105105100',    // MasterCard
   '6759649826438453',    // Maestro
   '6799990100000000019', // Maestro
   '4111111111111111',    // Visa
   '4012888888881881',    // Visa
*/

let acceptedCreditCards = {
    visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
    mastercard: /^5[1-5][0-9]{14}$|^2(?:2(?:2[1-9]|[3-9][0-9])|[3-6][0-9][0-9]|7(?:[01][0-9]|20))[0-9]{12}$/,
    amex: /^3[47]\d{13,14}$/,
    elo: /^((((636368)|(438935)|(504175)|(451416)|(636297))\d{0,10})|((5067)|(4576)|(4011))\d{0,12})$/
};

function checkSupported(value) {
    let accepted = false;
    let aux = 0;
    Object.keys(acceptedCreditCards).forEach(function (key) {
        var regex = acceptedCreditCards[key];
        if (regex.test(value)) {
            bandeira = aux;
            accepted = true;
        }
        aux++;
    });
    return accepted;
}

//validaçoes
let nomeCartao = false;
let numCartao = false;
let mesCartao = false;
let anoCartao = false;
let codCartao = false;
let transaction = false;

function validacao() {
    if (nomeCartao && numCartao && mesCartao && anoCartao && codCartao) {
        $("#ppc-msg-1").css('display', 'block');
        $("#ppc-msg-2").css('display', 'none');
        $("#save-card").css('background-color', 'rgb(250, 79, 38)');
        transaction = true;
    } else {
        $("#ppc-msg-1").css('display', 'none');
        $("#ppc-msg-2").css('display', 'block');
        $("#save-card").css('background-color', '#ccc');
        transaction = false
    }
}

function cardFlag(num){
    switch(num){
        case -1:
            $("#main-flag").val('');
            break;
        case 1:
            $("#main-flag").val('visa');
            break;
        case 2:
            $("#main-flag").val('mastercard');
            break;
        case 3:
            $("#main-flag").val('amex');
            break;
        case 4:
            $("#main-flag").val('elo');
            break;
        default:
            $("#main-flag").val('');
            break;
    }
}

function cardInfo(){
    let titular = $("#titular").val();
    let num = $("#num-cartao").val();
    let ano= $("#ano").val();
    let mes = $("#mes").val();
    let sec = $("#sec-cod").val();
    $("#main-titular").val(titular);
    $("#main-card").val(num);
    $("#main-mes").val(mes);
    $("#main-ano").val(ano);
    $("#main-sec").val(sec);
}

function cardInfo2(id, titular, num, mes, ano, sec) {
    if ($("#"+id).is(':checked')) {
        $("#main-titular").val(titular);
        $("#main-card").val(num);
        $("#main-mes").val(mes);
        $("#main-ano").val(ano);
        $("#main-sec").val(sec);
        nomeCartao = true;
        numCartao = true;
        mesCartao = true;
        anoCartao = true;
        codCartao = true;
        transaction = true;
        validacao();
        console.log('Deu certo');
    }else{
        console.log('shit');
    }
}

//validando nome cartao
$("#titular").keyup(function () {
    let titular = $("#titular").val();
    titular.includes(' ') && titular.length > 6 ? nomeCartao = true : nomeCartao = false;
    validacao();
});

//display none logo cartoes
function displayCards(){
    $("#card-logo-1").css('display', 'none');
    $("#card-logo-2").css('display', 'none');
    $("#card-logo-3").css('display', 'none');
    $("#card-logo-4").css('display', 'none');
}

//input cartao de credito
$("#num-cartao").keyup(function () {
    displayCards();
    let num = $("#num-cartao").val();
    if (num.length >= 16 || num.length == 15) {
        num = num.substring(0, 16);
        $("#num-cartao").val(num);
        cardValue = checkLuhn(num);
        cardAccept = checkSupported(num);
    }
    if (cardValue && cardAccept) {
        $("#card-logo-" + (bandeira + 1)).css('display', 'block');
        cardFlag(bandeira + 1);
        numCartao = true;
    } else {
        cardFlag(-1);
        numCartao = false;
    }
    validacao();
});

//validando mes cartao
$("#mes").keyup(function () {
    let num = $("#mes").val();
    if (num.length >= 2) {
        num = num.substring(0, 2);
        $("#mes").val(num);
        parseFloat(num) > 0 && parseFloat(num) <= 12 ? mesCartao = true : mesCartao = false;
        validacao();
    }
});

//validando ano cartao
$("#ano").keyup(function () {
    let num = $("#ano").val();
    if (num.length >= 4) {
        num = num.substring(0, 4);
        $("#ano").val(num);
        parseFloat(num) >= 2021 && parseFloat(num) <= 2032 ? anoCartao = true : mesCartao = false;
        validacao();
    }
});

//validando codigo de seguranca do cartao
$("#sec-cod").keyup(function () {
    let num = $("#sec-cod").val();
    if (num.length >= 3) {
        num = num.substring(0, 3);
        $("#sec-cod").val(num);
        parseFloat(num) > 0 && parseFloat(num) <= 999 ? codCartao = true : codCartao = false;
        validacao();
    }
});

//resetar informacoes cartao
$("#ppc-msg-3").click(function () {
    //aqui apos ajustar
    resetInfo();
});

function resetInfo(){
    nomeCartao = false;
    numCartao = false;
    mesCartao = false;
    anoCartao = false;
    codCartao = false;
    transaction = false;
    $("#titular").val('');
    $("#num-cartao").val('');
    $("#mes").val('');
    $("#ano").val('');
    $("#sec-cod").val('');
    $("#ppc-msg-1").css('display', 'none');
    $("#ppc-msg-2").css('display', 'none');
    $("#box-1").css('display','block');
    $("#box-2").css('display','none');
    displayCards();
};

//display exibicao
function showDisplay(){
    $("header").css('display', 'none');
    $("section").css('display', 'none');
    $("#car-box").css('display', 'none');
    $("footer").css('display', 'none');
    $("#display-time").css('display', 'block');
}

//botao comprar
$("#btn-comprar").click(function () {
    if (transaction && address) {
        cardInfo();
        showDisplay();
        //####################################
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        account.action = "ServConfirmPay";
        account.method = "POST";
        account.submit();
        //###################################
    } else {
        console.log('not ok!');
    }
});

//Remove card wallet.jsp
function removeCard(id){
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    $("#remove-card").val(id);
    let account = document.getElementById("main-form");
    account.action = "ServRemoveCard";
    account.method = "POST";
    account.submit();
}

//botao comprar
$("#save-card").click(function () {
    if (transaction) {
        cardInfo();
        //####################################
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        account.action = "ServSaveCard";
        account.method = "POST";
        account.submit();
        //###################################
    }
});

//###############################################################
//############       PAGAMENTO               ####################
//###############################################################