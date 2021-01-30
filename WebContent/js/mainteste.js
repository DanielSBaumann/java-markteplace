/*###########################################*/
/*#####            CARRINHO             #####*/
/*###########################################*/
/*
let listaP = new Array();
let sub = 0;

let Produto = class {
    constructor(id, nome, preco, desconto, qtd) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        this.desconto = desconto;
        this.qtd = qtd;
    }
}

let response = $("#lista-produtos").val();
console.log("RESPONSE -> "+response);
if (response != '' && response != '[]') {
    listaP = JSON.parse(response);
    $("#qtd-car").val(listaP.length);

    //teste subtotal
    sub = soma(listaP);
    console.log("subtotal page recarregada -> " + sub);
    
}

function add(id, nome, preco, desconto, qtd) {
    let p = new Produto(id, nome, preco, desconto, qtd);
    sub += parseFloat(preco);
    listaP.push(p);
    console.log(listaP);
    console.log("subtotal -> " + sub);
    $("#qtd-car").val(listaP.length);
}

//CONTINUAR AQUI
function soma(lista) {
    let sum = 0;
    for (let produto of lista) {
        sum += parseFloat(produto.preco);
    }
    console.log("sum -> "+sum);
    return sum;
}
*/
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
/*###########################################*/
/*#####            CARRINHO             #####*/
/*###########################################*/

/*###########################################*/
/*#####            SEARCH               #####*/
/*###########################################*/
$("#search").keypress(function(e){
    if(e.which == 13){
        console.log('enter press!')
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

//Acount Header
$("#account-header").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServAccount";
    account.method = "POST";
    account.submit();
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
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServMeusProdutos";
    account.method = "POST";
    account.submit();
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

/*###########################################*/
/*#####            Header               #####*/
/*###########################################*/

/*###########################################*/
/*#####             Footer              #####*/
/*###########################################*/

//Acount footer
$("#account-footer").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    console.log(account);
    account.action = "ServAccount";
    account.method = "POST";
    account.submit();
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

//Produtos Footer
$("#produtos-footer").click(function () {
    //lista-produtos
    $("#lista-produtos").val(JSON.stringify(listaP));
    //lista-produtos
    let account = document.getElementById("main-form");
    account.action = "ServMeusProdutos";
    account.method = "POST";
    account.submit();
});
/*###########################################*/
/*#####             Footer              #####*/
/*###########################################*/