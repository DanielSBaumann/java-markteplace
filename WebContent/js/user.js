let user = true;

$("#user").val(user);

function userAct() {
    user = false;
    $("#user").val(user);
    console.log(user);
}

function setId() {
    $.ajax({
        url: 'ServSetId',
        type: 'POST',
        data: { id: '-1' },
        success: function (responseText) {
            console.log('id setado -> ' + responseText);
        },
        error: function () {
            console.log('falha ao setar id -1 ->' + responseText);
            let logout = document.getElementById("main-form");
            logout.action = "ServLogout";
            logout.method = "POST";
            logout.submit();
        }
    });
}

function removeAll(){
    $("body header").remove();
    $("body section").remove();
    $("body div").remove();
    $("body footer").remove();
}

//teste tempo execucao
//setTimeout(function(){}, 4000);

function getOut() {
    setTimeout(function () {
        let out = document.getElementById("main-form");
        out.action = "ServOut";
        out.method = "POST";
        out.submit();
    }, 2000);
}

function getOut2(){
    let out = document.getElementById("out");
    out.action = "ServOut";
    out.method = "POST";
    out.submit();
}
