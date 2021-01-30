let dispo = false;

$(document).ready(function () {
    let dsct = $("#desconto").val() + '%';
    $("#desconto").val(dsct);
    if ($("#dispo").val() == "true") {
        dispo = true;
        $("#disponibilidade").prop("checked", true);
    } else {
        dispo = false;
    }
});

$("#disponibilidade").click(function () {
    if (dispo) {
        dispo = false;
    } else {
        dispo = true;
    }
});

$(".thumbs img").hover(function () {
    let cover = $(".cover img");
    let thumb = $(this).attr('src');
    if (cover.attr('src') !== thumb) {
        cover.fadeTo('200', '0', function () {
            cover.attr('src', thumb);
            cover.fadeTo('150', '1');
        });
    }
});

$("#qtd").keyup(function () {
    let aux = $("#qtd").val();
    if (aux.length > 2) {
        aux = aux.substring(0, 2);
    }
    $("#qtd").val(aux);
});

$("#qtd").focusout(function () {
    let aux = $("#qtd").val();
    if (aux == '0' || aux == '00') {
        $("#disponibilidade").prop("checked", false);
    }
});

$("#desconto").keyup(function () {
    let aux = $("#desconto").val().replaceAll('%', '');
    if (aux.length > 2) {
        aux = aux.substring(0, 2);
    }
    $("#desconto").val(aux + '%');
});

$("#btn-prod-update").click(function () {
    let desconto = $("#desconto").val().replaceAll('%', '');
    let qtd = $("#desconto").val();
    $("#desconto").val(desconto)
    $("#dispo").val(dispo)
    let send = document.getElementById("main-form");
    send.action = "ServUpdateProduto";
    send.method = "POST";
    send.submit();
});