//###################################
//###########IMAGEM 1################
//###################################
$("#real-input-1").change(function () {

    const file = $(this)[0].files[0];
    const fileReader = new FileReader();
    fileReader.onloadend = function () {
        $("#img-1").attr('src', fileReader.result);
    };
    fileReader.readAsDataURL(file);

    $("#box-img-1").css('visibility', 'visible');
    $("#sb-1").css('background-color', 'white');
    $("#sb-txt-1").css('visibility', 'hidden');
    $("#sb-close-1").css('visibility', 'visible');
});
//REMOVENDO IMAGEM
$("#sb-close-1").click(function () {
    $("#img-1").attr('src', '');
    $("#box-img-1").css('visibility', 'hidden');
    $("#sb-1").css('background-color', 'rgb(163, 158, 158)');
    $("#sb-txt-1").css('visibility', 'visible');
    $("#sb-close-1").css('visibility', 'hidden');
});

//###################################
//###########IMAGEM 1################
//###################################

//###################################
//###########IMAGEM 2################
//###################################
$("#real-input-2").change(function () {

    const file = $(this)[0].files[0];
    const fileReader = new FileReader();
    fileReader.onloadend = function () {
        $("#img-2").attr('src', fileReader.result);
    };
    fileReader.readAsDataURL(file);

    $("#box-img-2").css('visibility', 'visible');
    $("#sb-2").css('background-color', 'white');
    $("#sb-txt-2").css('visibility', 'hidden');
    $("#sb-close-2").css('visibility', 'visible');
});
//REMOVENDO IMAGEM
$("#sb-close-2").click(function () {
    $("#img-2").attr('src', '');
    $("#box-img-2").css('visibility', 'hidden');
    $("#sb-2").css('background-color', 'rgb(117, 109, 109)');
    $("#sb-txt-2").css('visibility', 'visible');
    $("#sb-close-2").css('visibility', 'hidden');
});
//###################################
//###########IMAGEM 2################
//###################################

//###################################
//###########IMAGEM 3################
//###################################
$("#real-input-3").change(function () {

    const file = $(this)[0].files[0];
    const fileReader = new FileReader();
    fileReader.onloadend = function () {
        $("#img-3").attr('src', fileReader.result);
    };
    fileReader.readAsDataURL(file);

    $("#box-img-3").css('visibility', 'visible');
    $("#sb-3").css('background-color', 'white');
    $("#sb-txt-3").css('visibility', 'hidden');
    $("#sb-close-3").css('visibility', 'visible');
});
//REMOVENDO IMAGEM
$("#sb-close-3").click(function () {
    $("#img-3").attr('src', '');
    $("#box-img-3").css('visibility', 'hidden');
    $("#sb-3").css('background-color', 'rgb(163, 158, 158)');
    $("#sb-txt-3").css('visibility', 'visible');
    $("#sb-close-3").css('visibility', 'hidden');
});
//###################################
//###########IMAGEM 3################
//###################################

//###################################
//###########IMAGEM 4################
//###################################
$("#real-input-4").change(function () {

    const file = $(this)[0].files[0];
    const fileReader = new FileReader();
    fileReader.onloadend = function () {
        $("#img-4").attr('src', fileReader.result);
    };
    fileReader.readAsDataURL(file);

    $("#box-img-4").css('visibility', 'visible');
    $("#sb-4").css('background-color', 'white');
    $("#sb-txt-4").css('visibility', 'hidden');
    $("#sb-close-4").css('visibility', 'visible');
});
//REMOVENDO IMAGEM
$("#sb-close-4").click(function () {
    $("#img-4").attr('src', '');
    $("#box-img-4").css('visibility', 'hidden');
    $("#sb-4").css('background-color', 'rgb(117, 109, 109)');
    $("#sb-txt-4").css('visibility', 'visible');
    $("#sb-close-4").css('visibility', 'hidden');
});
//###################################
//###########IMAGEM 4################
//###################################

//###################################
//###########BTN CADASTRAR###########
//###################################
$("#cadastrar-produto").click(function () {
    let aux = document.getElementById("form-cad");
    aux.action = "ServProduto";
    aux.method = "POST";
    aux.submit();
});
        //###################################
        //###########BTN CADASTRAR###########
        //###################################