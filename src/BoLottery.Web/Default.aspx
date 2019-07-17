<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TygaSoft.Web.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>歡迎您</title>
    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Scripts/plugins/jeasyui/themes/gray/easyui.css" rel="stylesheet" type="text/css" />
    <link href="/Scripts/plugins/jeasyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/plugins/jeasyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="/Scripts/plugins/jeasyui/locale/easyui-lang-zh_TW.js" type="text/javascript"></script>
    <script src="Scripts/JeasyuiHelper.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="w">
        <div class="PathOne">
            <a href="javascript:void(0)" onclick="currFun.DlgOpen()"><img src="Images/pathone.jpg" alt="线路1" /></a>
        </div>
        
    </div>

    </form>

    <div id="dlgWaiting" class="easyui-dialog" data-options="closed:true,modal:true,collapsible:false" title="" style="width:220px;height:60px; padding:10px;">
		<div class="waiting">正在执行，请稍后......</div>
	</div>

    <div id="dlg" class="easyui-dialog" title="登 录" data-options="closed:true,modal:true,
href:'/Templates/Html/Login.htm',buttons: [{
	    text:'登录',iconCls:'icon-ok',
	    handler:function(){
		    currFun.ValidLogin();
	    }
    },{
	    text:'取消',iconCls:'icon-cancel',
	    handler:function(){
		    $('#dlg').dialog('close');
	    }
    }]" style="width:390px;height:210px;padding:20px">
    
</div>

<div id="dlgLogin" class="easyui-dialog" title="" data-options="closed:true,modal:true,
href:'/Templates/Html/GameAgreement.htm',buttons: [{
	    text:'同意',iconCls:'icon-ok',
	    handler:function(){
		    currFun.Login();
	    }
    },{
	    text:'不同意',iconCls:'icon-cancel',
	    handler:function(){
		    $('#dlgLogin').dialog('close');
	    }
    }]" style="width:780px;height:500px;padding:10px">
    
</div>

    <script type="text/javascript">
        $(function () {
            
        })
        var currFun = {
            DlgOpen: function () {
                $('#dlg').dialog('open');
            },
            ValidLogin: function () {
                var isValid = $('#dlgFm').form('validate');
                if (!isValid) return false;

                var userName = $("#txtUserName").val();
                var psw = $("#txtPsw").val();
                var vc = $("#txtVc").val();

                $.ajax({
                    url: "/ScriptServices/SharesService.asmx/ValidLogin",
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    data: '{userName:"' + userName + '",psw:"' + psw + '",vc:"' + vc + '"}',
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function () {
                        $("#dlgWaiting").dialog('open');
                    },
                    complete: function () {
                        $("#dlgWaiting").dialog('close');
                    },
                    success: function (data) {
                        var msg = data.d;
                        if (msg == "1") {
                            $('#dlg').dialog('close');
                            $(".PathOne").hide();
                            $('#dlgLogin').dialog('open');
                        }
                        else {
                            $.messager.alert('系统提示', msg, 'info');
                        }
                    }
                });
            },
            Login: function () {
                var userName = $("#txtUserName").val();
                var psw = $("#txtPsw").val();

                $.ajax({
                    url: "/ScriptServices/SharesService.asmx/Login",
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    data: '{userName:"' + userName + '",psw:"' + psw + '"}',
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function () {
                        $("#dlgWaiting").dialog('open');
                    },
                    complete: function () {
                        $("#dlgWaiting").dialog('close');
                    },
                    success: function (data) {
                        var msg = data.d;
                        if (msg == "1") {
                            window.location = "/u/t";
                            jeasyuiFun.show("温馨提示", "登录成功，请稍后......");
                        }
                        else {
                            $.messager.alert('系统提示', msg, 'info');
                        }
                    }
                });
            }
        }
    </script>
</body>
</html>
