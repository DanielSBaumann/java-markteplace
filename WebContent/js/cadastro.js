//#########################################
//###############SENHA#####################
//#########################################
/*See Password*/
$("#eye-senha").click(function () {
    $("#eye-senha").css('display', 'none');
    $("#close-eye-senha").css('display', 'block');
    $('#senha').prop('type', 'text');
});
/*Don't see*/
$("#close-eye-senha").click(function () {
    $("#close-eye-senha").css('display', 'none');
    $("#eye-senha").css('display', 'block');
    $('#senha').prop('type', 'password');
});
//#########################################
//###############SENHA#####################
//#########################################

//#########################################
//###############CPF#######################
//#########################################
let cpf = $("#cpf").val();
let cpfId = false;

if (cpf == "null") {
    $("#cpf").val("");
    cpfId = false;
} else {
    $('#cpf').prop('readonly', true);
    cpfId = true;
}
//TESTE

$("#cpf").keyup(function () {
    if (cpf == "null") {
        let aux = $('#cpf').val();
        if (validarCpf(aux) && aux.match(/^[0-9]+$/) && aux.length == 11) {
            $("#box-cpf").css('border-color', 'rgb(204, 199, 199)');
            $("#x-cpf").css('display', 'none');
            $("#check-cpf").css('color', 'lightgreen');
            cpfId = true;
        } else {
            $("#check-cpf").css('color', 'transparent');
            $("#box-cpf").css('border-color', 'red');
            $("#x-cpf").css('display', 'block');
            cpfId = false;
        }
    }
});

//########CALCULO CPF####################
function validarCpf(cpf) {
    let posicao = 0;
    let soma1 = 0;
    for (let i = 10; i >= 2; i--) {
        soma1 += parseInt(cpf[posicao]) * i;
        posicao++;
    }
    posicao = 0;
    let soma2 = 0;
    for (let i = 11; i >= 2; i--) {
        soma2 += parseInt(cpf[posicao]) * i;
        posicao++;
    }
    if ((soma1 * 10) % 11 == parseInt(cpf[9]) && (soma2 * 10) % 11 == parseInt(cpf[10])) {
        return true;
    } else {
        return false;
    }
}
//########CALCULO CPF####################

/*ERROR BOX*/
$("#x-cpf").mouseenter(function () {
    $("#eb-cpf").css('display', 'block');
});
$("#x-cpf").mouseleave(function () {
    $("#eb-cpf").css('display', 'none');
});
//#########################################
//###############CPF#######################
//#########################################

//#########################################
//###############NIVER#######################
//#########################################
//Verificar niver
let niver = $("#niver").val();
let niverId = false;
if (niver == "null") {
    $("#niver").prop('type', 'date');
    niverId = false;
} else {
    $("#niver").val(niver.substr(8, 2) + '/' + niver.substr(5, 2) + '/' + niver.substr(0, 4));
    $("#niver").prop({ 'type': 'text', 'readonly': 'true' });
    niverId = true;
}
$("#niver").focusout(function () {
    let aux = $('#niver').val();
    console.log(aux);
    if (aux != "") {
        niverId = true;
    } else {
        niverId = false;
    }
});
//#########################################
//###############NIVER#####################
//#########################################

//#########################################
//###############TELEFONE##################
//#########################################
let valTel = $("#telefone").val();
let tel = false;
if (valTel == "null") {
    $("#telefone").val("");
    tel = false;
} else {
    tel = true;
}
$("#telefone").focusout(function () {
    let aux = $('#telefone').val();
    if (aux.match(/^[0-9@.]+$/) && aux.length >= 10 && aux.length < 12) {
        console.log("ok");
        $("#box-telefone").css('border-color', 'rgb(204, 199, 199)');
        $("#x-telefone").css('display', 'none');
        $("#check-telefone").css('color', 'lightgreen');
        tel = true;
    } else {
        console.log("Not ok");
        $("#check-telefone").css('color', 'transparent');
        $("#box-telefone").css('border-color', 'red');
        $("#x-telefone").css('display', 'block');
        tel = false;
    }
});
/*ERROR BOX*/
$("#x-telefone").mouseenter(function () {
    $("#eb-telefone").css('display', 'block');
});
$("#x-telefone").mouseleave(function () {
    $("#eb-telefone").css('display', 'none');
});
//#########################################
//###############TELEFONE##################
//#########################################

//#########################################
//###############CEP#######################
//#########################################
let valCep = $("#cep").val();
let cep = false;
if (valCep == "null") {
    $("#cep").val("");
    cep = false;
} else {
    cep = true;
}

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
                $('#uf').val(endereco.uf)
                $("#box-uf").css('border-color', 'rgb(204, 199, 199)');
                $("#x-uf").css('display', 'none');
                $("#check-uf").css('color', 'lightgreen');
                uf = true;
                //cidade
                $('#cidade').val(endereco.cidade)
                $("#box-cidade").css('border-color', 'rgb(204, 199, 199)');
                $("#x-cidade").css('display', 'none');
                $("#check-cidade").css('color', 'lightgreen');
                city = true;
                //endereco
                $('#endereco').val(endereco.logradouro)
                $("#box-endereco").css('border-color', 'rgb(204, 199, 199)');
                $("#x-endereco").css('display', 'none');
                $("#check-endereco").css('color', 'lightgreen');
                addres = true;
                //cep
                $("#box-cep").css('border-color', 'rgb(204, 199, 199)');
                $("#x-cep").css('display', 'none');
                $("#check-cep").css('color', 'lightgreen');
                cep = true;
            } else {
                $("#check-cep").css('color', 'transparent');
                $("#box-cep").css('border-color', 'red');
                $("#x-cep").css('display', 'block');
                cep = false;
            }
        };
        xhr.send(null);
        //API  CEP
    } else {
        console.log("Not ok");
        $("#check-cep").css('color', 'transparent');
        $("#box-cep").css('border-color', 'red');
        $("#x-cep").css('display', 'block');
        cep = false;
    }
});
/*ERROR BOX*/
$("#x-cep").mouseenter(function () {
    $("#eb-cep").css('display', 'block');
});
$("#x-cep").mouseleave(function () {
    $("#eb-cep").css('display', 'none');
});
//#########################################
//###############CEP#######################
//#########################################

//#########################################
//###############UF########################
//#########################################
let valUf = $("#uf").val();
let uf = false;
if (valUf == "null") {
    $("#uf").val("");
    uf = false;
} else {
    uf = true;
}
$("#uf").focusout(function () {
    let aux = $('#uf').val().toLowerCase();
    if (aux.match("rj") || aux.match("sp") || aux.match("mg") || aux.match("es")) {
        console.log("ok");
        $("#box-uf").css('border-color', 'rgb(204, 199, 199)');
        $("#x-uf").css('display', 'none');
        $("#check-uf").css('color', 'lightgreen');
        uf = true;
    } else {
        console.log("Not ok");
        $("#check-uf").css('color', 'transparent');
        $("#box-uf").css('border-color', 'red');
        $("#x-uf").css('display', 'block');
        uf = false;
    }
});
/*ERROR BOX*/
$("#x-uf").mouseenter(function () {
    $("#eb-uf").css('display', 'block');
});
$("#x-uf").mouseleave(function () {
    $("#eb-uf").css('display', 'none');
});
//#########################################
//###############UF########################
//#########################################

//#########################################
//###############CIDADE####################
//#########################################
let valCity = $("#cidade").val();
let city = false;
if (valCity == "null") {
    $("#cidade").val("");
    city = false;
} else {
    city = true;
}
$("#cidade").focusout(function () {
    let aux = $('#cidade').val().toLowerCase();
    if (aux.match(/^[a-zA-Z ]+$/)) {
        console.log("ok");
        $("#box-cidade").css('border-color', 'rgb(204, 199, 199)');
        $("#x-cidade").css('display', 'none');
        $("#check-cidade").css('color', 'lightgreen');
        city = true;
    } else {
        console.log("Not ok");
        $("#check-cidade").css('color', 'transparent');
        $("#box-cidade").css('border-color', 'red');
        $("#x-cidade").css('display', 'block');
        city = false;
    }
});
/*ERROR BOX*/
$("#x-cidade").mouseenter(function () {
    $("#eb-cidade").css('display', 'block');
});
$("#x-cidade").mouseleave(function () {
    $("#eb-cidade").css('display', 'none');
});
//#########################################
//###############CIDADE####################
//#########################################

//#########################################
//###############ADRESS####################
//#########################################
let valAdress = $("#endereco").val();
let addres = false;
if (valAdress == "null") {
    $("#endereco").val("");
    addres = false;
} else {
    addres = true;
}
$("#endereco").focusout(function () {
    let aux = $('#endereco').val().toLowerCase();
    if (aux.match(/^[a-zA-Z0-9 ]+$/)) {
        console.log("ok");
        $("#box-endereco").css('border-color', 'rgb(204, 199, 199)');
        $("#x-endereco").css('display', 'none');
        $("#check-endereco").css('color', 'lightgreen');
        addres = true;
    } else {
        console.log("Not ok");
        $("#check-endereco").css('color', 'transparent');
        $("#box-endereco").css('border-color', 'red');
        $("#x-endereco").css('display', 'block');
        addres = false;
    }
});
/*ERROR BOX*/
$("#x-endereco").mouseenter(function () {
    $("#eb-endereco").css('display', 'block');
});
$("#x-endereco").mouseleave(function () {
    $("#eb-endereco").css('display', 'none');
});
//#########################################
//###############ADRESS####################
//#########################################

/*BTN UPDATE*/
$("#updt").click(function () {
    if (cpfId && niverId && cep && uf && city && addres) {
        //AJUSTAR DATA
        let n = $("#aniversario").val();
        console.log(n);
        if (n != "null") {
            $('#niver').val(n);
        }
        //AJUSTAR DATA
        let aux = document.getElementById("main-form");
        aux.action = "ServUpdateUser";
        aux.method = "POST";
        aux.submit();
    } else {
        alert("not ok!");
    }
});
/*BTN UPDATE*/