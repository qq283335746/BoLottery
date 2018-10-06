
var jsHelper = {
    OpenWaiting: function () {
        $("#dlgWaiting").dialog('open');
    },
    CloseWaiting: function () {
        $("#dlgWaiting").dialog('close');
    },
    StartProgressbar: function () {
        var value = $('#pgsBar').progressbar('getValue');
        if (value < 90) {
            value += Math.floor(Math.random() * 10);
            $('#pgsBar').progressbar('setValue', value);
            setTimeout(arguments.callee, 300);
        }
        else if (value >= 90 && value < 99) {
            value += 1;
            $('#pgsBar').progressbar('setValue', value);
            setTimeout(arguments.callee, 300);
        }
    },
    EndProgressbar: function () {
        var value = $('#pgsBar').progressbar('getValue');
        if (value < 100) {
            value += Math.floor(Math.random() * 10);
            $('#pgsBar').progressbar('setValue', value);
            setTimeout(arguments.callee, 300);
        }
    },
    OnProgressbarChange: function (value) {
        if (value >= 100) {
            alert(value);
            $("#dlgPgsbar").dialog('close');
        }
    },
    OnDlgClose: function () {
        $("#dlgPgsbar").dialog('close');
    },
    GetUserPrice: function () {
        $.ajax({
            type: "POST",
            url: "/ScriptServices/UsersService.asmx/GetUserPrice",
            contentType: "application/json; charset=utf-8",
            data: "",
            success: function (data) {
                var jsonData = (new Function("", "return " + data.d))();
                $.map(jsonData, function (item) {
                    $("#lbUserTotalPrice").text(item.TotalPrice);
                    $("#lbRemainPrice").text(item.RemainPrice);
                    $("#lbScore").text(item.TotalScore);
                })
            }
        })
    },
    //加入收藏夹
    AddFavorite: function () {
        if (document.all) {
            window.external.addFavorite('http://www.tyga.com/', '天涯孤岸电子商务');
        }
        else if (window.sidebar) {
            window.sidebar.addPanel('天涯孤岸电子商务', 'http://www.tyga.com/', "");
        }
        else {
            alert("您的浏览器不支持，请手动添加。");
        }
    },
    OnDlgLogin: function () {
        var isValid = $('#dlgFm').form('validate');
        if (!isValid) return false;

        var userName = $("#txtUserName").val();
        var psw = $("#txtPsw").val();
        var vc = $("#txtVc").val();

        $.ajax({
            type: "POST",
            async: false,
            url: "/ScriptServices/SharesService.asmx/Login",
            contentType: "application/json; charset=utf-8",
            data: '{userName:"' + userName + '",psw:"' + psw + '",vc:"' + vc + '"}',
            success: function (data) {
                msg = data.d;
                if (msg == 1) {
                    jeasyuiFun.show("温馨提醒", "登录成功");
                    $('#dlg').dialog('close');
                }
                else {
                    $.messager.alert('系统提示', msg, 'info');
                    return false;
                }
            }
        })
    }
}