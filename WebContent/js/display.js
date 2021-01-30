$(document).ready(function () {
    //DISPLAY CARDS NONE CASO SRC = NULL
    for (let i = 2; i < 5; i++) {
        let aux = $("#thumb-" + i);
        if (aux.attr('src') == "img-produtos/null") {
            $("#thumb-" + i).css('display', 'none');
        }
    }
    //EXIBIR PRECO FINAL
    let pf = parseFloat($("#pf").val());
    $("#preco-final").html(pf.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
    let dsct = parseFloat($("#dsct").val());
    $("#desconto-4").html(dsct.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
    //DESCONTO & DESTAQUE
    let desconto = $("#desconto-1").val();
    if (desconto == "0%") {
        $("#desconto-1").css('display', 'none');
        $("#desconto-2").css('display', 'none');
        $("#desconto-3").css('display', 'none');
        $("#destaque-1").css('display', 'none');
    } else if (parseFloat(desconto.replace('%', '') < 15)) {
        $("#destaque-1").css('display', 'none');
    }
});

$(".thumbs img").hover(function () {
    let cover = $(".dp-main-img img");
    let thumb = $(this).attr('src');
    if (cover.attr('src') !== thumb) {
        cover.fadeTo('200', '0', function () {
            cover.attr('src', thumb);
            cover.fadeTo('150', '1');
        });
    }
});