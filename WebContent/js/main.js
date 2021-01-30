/*###########################################*/
/*#####            CARRINHO             #####*/
/*###########################################*/

let listaP = new Array();
let sub = 0;

let Produto = class {
    constructor(id, nome, preco, precoFinal, desconto, qtd, qtdEstoque, imagem, anunciante) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        this.precoFinal = precoFinal;
        this.desconto = desconto;
        this.qtd = qtd;
        this.qtdEstoque = qtdEstoque;
        this.imagem = imagem;
        this.anunciante = anunciante;
    }
}

let response = $("#lista-produtos").val();
console.log("RESPONSE -> "+response);
if (response != '' && response != '[]') {
    listaP = JSON.parse(response);
    console.log(listaP);
    $("#qtd-car").val(listaP.length);
    //TESTE MONTANDO PAGE
    $("#car-empty").css('display','none');
    $("#car-display").css('display','grid');
    /*$("#car-ft").css('display','block');*/
    $("#car-ft").css('display','grid');
    displayMany(listaP);
    //TESTE MONTANDO PAGE
}else{
    $("#car-empty").css('display','block');
    $("#car-display").css('display','none');
    $("#car-ft").css('display','none');
}

function add(id, nome, preco, precoFinal, desconto, qtd, qtdEstoque, imagem, anunciante) {
    let p = new Produto(id, nome, preco, precoFinal, desconto, qtd, qtdEstoque, imagem, anunciante);
    if (repeat(p)) {
        sub += parseFloat(precoFinal * qtd);
        listaP.push(p);
        $("#qtd-car").val(listaP.length);
        $("#car-empty").css('display', 'none');
        $("#car-display").css('display', 'grid');
        $("#car-ft").css('display', 'grid');
        display(p, (listaP.length - 1));
        //SUBTOTAL ATUALIZADO
        $("#car-box-sub").html(sub.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
        //setando lista de compras no database caso user = true(logado)
        let validate = $("#user").val();
        if (validate == 'true') {
            setKart();
        }
    }
}

function soma(lista) {
    let sum = 0;
    for (let produto of lista) {
        sum += parseFloat(produto.preco);
    }
    console.log("sum -> "+sum);
    return sum;
}

function repeat(prod) {
    for (let produto of listaP) {
        if (produto.id == prod.id) {
            return false;
        }
    }
    return true;
}

function setKart(){
    let send = JSON.stringify(listaP);
    $.ajax({
        url: 'ServUpdateKart',
        type: 'POST',
        data: { lista: send },
        success: function (responseText) {
            console.log('update carrinho ok -> ' + responseText);
        },
        error: function () {
            console.log('falha ao fazer update carrinho no db ->' + responseText);
        }
    });
}

//METODO PARA 1 ELEMENTO SOMENTE!!!
function display(prod,index) {

    let div = 
        '<div class=\"car-box-prod\">' +
            '<div class=\"car-box-prod-img\">' +
                '<img src=\"' + prod.imagem + '\" alt=\"#\">' +
            '</div>' +
            '<div class=\"car-box-prod-txt\">' +
                '<p>' + prod.nome + '</p>' +
                '<p>Anunciante: <a onclick="pageVendor(\'' + prod.id + '\',\'' + prod.anunciante + '\')">' + prod.anunciante + '</a></p>'+
                '<p>' + prod.qtd + 'x</p>' +
                '<p>' + parseFloat(prod.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</p>' +
            '</div>' +
            '<div class=\"car-box-prod-trash\" ondblclick=\"remove(' + index + ')\">' +
                '<ion-icon name=\"trash-outline\"></ion-icon>' +
            '</div>' +
        '</div>';
    $("#car-display").append(div);
}

//METODO PARA VARIOS ELEMENTOS!!!
function displayMany(lista){
    let ind = 0;
    sub = 0;
    for (let produto of lista) {
        let div =   
        '<div class=\"car-box-prod\">'+
            '<div class=\"car-box-prod-img\">'+
                '<img src=\"' + produto.imagem + '\" alt=\"#\">'+
            '</div>'+
            '<div class=\"car-box-prod-txt\">'+
                '<p>' + produto.nome + '</p>'+
                '<p>Anunciante: <a onclick="pageVendor(\'' + produto.id + '\',\'' + produto.anunciante + '\')">' + produto.anunciante + '</a></p>'+
                '<p>' + produto.qtd + 'x</p>'+
                '<p>' + parseFloat(produto.precoFinal).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) + '</p>' +
            '</div>'+
            '<div class=\"car-box-prod-trash\" ondblclick=\"remove(' + ind + ')\">' +
                '<ion-icon name=\"trash-outline\"></ion-icon>' +
            '</div>' +
        '</div>';
        ind++;
        sub += parseFloat(produto.precoFinal * produto.qtd);
        $("#car-display").append(div);
    }
    //SUBTOTAL ATUALIZADO
    $("#car-box-sub").html(sub.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }));
}

function remove(num) {
    listaP.splice(num, 1);
    //PARA PAGINA CARRINHO
    $("#build").val(num).trigger("change");
    //PARA PAGE PAYMENT
    $("#lista-pagamento").val(JSON.stringify(listaP)).trigger("change");
    $("#car-display div").remove();
    $("#qtd-car").val(listaP.length);
    displayMany(listaP);
    let validate = $("#user").val();
    if (validate == 'true') {
        setKart();
    }
    if (listaP.length == 0) {
        $("#car-empty").css('display', 'block');
        $("#car-display").css('display', 'none');
        $("#car-ft").css('display', 'none');
    }
}

function removeKart(num) {
    listaP.splice(num, 1);
    $("#car-display div").remove();
    $("#qtd-car").val(listaP.length);
    displayMany(listaP);
    let validate = $("#user").val();
    if (validate == 'true') {
        setKart();
    }
    if (listaP.length == 0) {
        $("#car-empty").css('display', 'block');
        $("#car-display").css('display', 'none');
        $("#car-ft").css('display', 'none');
    }
}

function updateList(lista) {
    listaP = lista;
    let validate = $("#user").val();
    if (validate == 'true') {
        setKart();
    }
}

//let's work here
function pageVendor(id, nome) {
    $("#prod-vendor").val(id);
    $("#name-vendor").val(nome);
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServVendor";
    account.method = "POST";
    account.submit();
}

//DISPLAY CARRINHO
$("#car-header").click(function () {
    $("#car-box").css('left','10%');
    $("#car-box").css('box-shadow','-120px 0px 5px 0px rgba(50, 50, 50, 0.65)');
    $("#burg").css('display', 'block');
    $("#burg-on").css('left', '-350px');
    $("#burg-on").css('box-shadow', 'none');
    $("#lupa").css('display', 'block');
    $("#lupa-open").css('right', '-1200px');
    $("#lupa-open").css('box-shadow', 'none');
});
$("#car-footer").click(function(){
    $("#car-box").css('left','10%');
    $("#car-box").css('box-shadow','-120px 0px 5px 0px rgba(50, 50, 50, 0.65)');
    $("#lupa").css('display', 'block');
    $("#lupa-open").css('right', '-1200px');
    $("#lupa-open").css('box-shadow', 'none');
});
$("#car-box-close").click(function(){
    $("#car-box").css('left','100%');
    $("#car-box").css('box-shadow','none');
});

//direcionando para pagina de pagamento pagina car.jsp
$("#kart-payment").click(function(){
    let validate = $("#user").val();
    if(sub > 0 && validate == 'true'){
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let pay = document.getElementById("main-form");
        pay.action = "ServPayment";
        pay.method = "POST";
        pay.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});

//direcionando para pagina de pagamento
$("#car-payment").click(function(){
    let validate = $("#user").val();
    if(sub > 0 && validate == 'true'){
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let pay = document.getElementById("main-form");
        pay.action = "ServPayment";
        pay.method = "POST";
        pay.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});
/*###########################################*/
/*#####            CARRINHO             #####*/
/*###########################################*/

/*###########################################*/
/*#####            SEARCH               #####*/
/*###########################################*/
$("#search").keypress(function (e) {
    if (e.which == 13 && $("#search").val() != '') {
        let search = $("#search").val();
        $("#main-search").val(search);
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServSearch";
        account.method = "POST";
        account.submit();
    }
});
$("#search-2").keypress(function (e) {
    if (e.which == 13 && $("#search").val() != '') {
        let search = $("#search").val();
        $("#main-search").val(search);
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServSearch";
        account.method = "POST";
        account.submit();
    }
});
/*###########################################*/
/*#####            SEARCH               #####*/
/*###########################################*/

/*###########################################*/
/*#####            Header              #####*/
/*###########################################*/

//Lupa On
$("#lupa").click(function () {
    $("#lupa-open").css('right', '-48px');
    $("#lupa-open").css('box-shadow', ' 0px 125px 12px 560px rgba(50, 50, 50, 0.65)');
    $("#lupa").css('display', 'none');
    $("#burg").css('display', 'block');
    $("#burg-on").css('left', '-350px');
    $("#burg-on").css('box-shadow', 'none');
});

//Lupa Off
$("#lupa-close").click(function () {
    $("#lupa").css('display', 'block');
    $("#lupa-open").css('right', '-1200px');
    $("#lupa-open").css('box-shadow', 'none');
    
});

//Burg On
$("#burg").click(function () {
    $("#burg-on").css('left', '-8px');
    $("#burg-on").css('box-shadow', '360px -1px 0px 360px rgba(0,0,0,0.65)');
    $("#burg").css('display', 'none');
    $("#car-box").css('left','100%');
    $("#car-box").css('box-shadow','none');
});

//Burg Off
$("section,footer").click(function () {
    $("#burg").css('display', 'block');
    $("#burg-on").css('left', '-350px');
    $("#burg-on").css('box-shadow', 'none');
});

//Home Header
$("#home-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServHome";
    account.method = "POST";
    account.submit();
});

function goHome(){
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    let account = document.getElementById("main-form");
    account.action = "ServHome";
    account.method = "POST";
    account.submit();
}

//KART Home
$("#kart-home").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServHome";
    account.method = "POST";
    account.submit();
});

//Carteira Header
$("#wallet-header").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServWallet";
        account.method = "POST";
        account.submit();
    }else{
        alert('Por favor faca login para acessar esta pagina')
    }
});

//Acount Header
$("#account-header").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServAccount";
        account.method = "POST";
        account.submit();
    }else{
        alert('Por favor faca login para acessar esta pagina')
    }
});

//Logout Header
$("#logout-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let logout = document.getElementById("main-form");
    logout.action = "ServLogout";
    logout.method = "POST";
    logout.submit();
});

//Produtos Header
$("#produtos-header").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        account.action = "ServMeusProdutos";
        account.method = "POST";
        account.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});

//Eletronicos Header
$("#eletronicos-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdEletronicos";
    account.method = "POST";
    account.submit();
});

//Acessorios Header
$("#acessorios-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdAcessorios";
    account.method = "POST";
    account.submit();
});

//Infantil Header
$("#infantil-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdInfantil";
    account.method = "POST";
    account.submit();
});

//Fashion Header
$("#fashion-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdFashion";
    account.method = "POST";
    account.submit();
});

//Esportes Header
$("#esportes-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdEsportes";
    account.method = "POST";
    account.submit();
});

//Livros Header
$("#livros-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServProdLivros";
    account.method = "POST";
    account.submit();
});

//Carrinho Header
$("#carrinho-header").click(function () {
    if (sub > 0) {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServCarrinho";
        account.method = "POST";
        account.submit();
    }else{
        alert('Seu carrinho está vazio!');
    }
});

$("#car-page").click(function () {
    if (sub > 0) {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        let account = document.getElementById("main-form");
        account.action = "ServCarrinho";
        account.method = "POST";
        account.submit();
    }else{
        alert('Seu carrinho está vazio!');
    }
});

/*###########################################*/
/*#####            Header               #####*/
/*###########################################*/

/*###########################################*/
/*#####             Footer              #####*/
/*###########################################*/

//login footer
let log = $("#user").val();
if(log=='true'){
    $("#account-footer").css('display','block');
    $("#login-footer").css('display','none');
}else{
    $("#account-footer").css('display','none');
    $("#login-footer").css('display','block'); 
}

$("#login-footer").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServEnter";
    account.method = "POST";
    account.submit();
});

//Acount footer
$("#account-footer").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        console.log(account);
        account.action = "ServAccount";
        account.method = "POST";
        account.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});

//Home Footer
$("#home-footer").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServHome";
    account.method = "POST";
    account.submit();
});

//Wallet Footer
$("#wallet-footer").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        account.action = "ServWallet";
        account.method = "POST";
        account.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});

//Produtos Footer
$("#produtos-footer").click(function () {
    let validate = $("#user").val();
    if (validate == 'true') {
        //lista-produtos
        $("#lista-produtos").val(JSON.stringify(listaP));
        //lista-produtos
        let account = document.getElementById("main-form");
        account.action = "ServMeusProdutos";
        account.method = "POST";
        account.submit();
    } else {
        alert('Por favor faca login para acessar esta pagina')
    }
});
/*###########################################*/
/*#####             Footer              #####*/
/*###########################################*/