<%@ Page Title="設置管理員" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddManager.aspx.cs" Inherits="TygaSoft.Web.Admin.Game.AddManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="easyui-panel" title="設置管理員" data-options="fit:true" style="padding:10px;"> 

    <div class="row">
        <span class="fl rl"><b class="cr">*</b>管理員類型：</span>
        <div class="fl">
            <select id="cbbManager" runat="server" class="easyui-combobox" style="width:200px;">
		    <option>二級管理員</option>
		    <option>三級管理員</option>
	        </select>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl"><b class="cr">*</b>管理員帳號：</span>
        <div class="fl">
            <input type="text" runat="server" id="txtUserName" clientidmode="Static" maxlength="50"  tabindex="1" class="easyui-validatebox txt" data-options="required:true" />
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl"><b class="cr">*</b>設置密碼：</span>
        <div class="fl">
            <input type="password" runat="server" id="txtPswset" maxlength="50" tabindex="2" class="easyui-validatebox txt" data-options="required:true" />
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl"><b class="cr">*</b>確認密碼：</span>
        <div class="fl">
            <input type="password" runat="server" id="txtPsw" maxlength="50" tabindex="3" class="easyui-validatebox txt" data-options="required:true" />
        </div>
        <span class="clr"></span>
    </div>

</div>

<input type="hidden" id="hOp" runat="server" />

<script type="text/javascript" src="/Scripts/Jeasyui.js"></script>
 <script type="text/javascript">
     $(function () {
         $(document).bind("keydown", function (e) {
             var key = e.which;
             if (key == 13) {
                 OnSave();
             }
         })
         //输入用户名鼠标离开事件
         $("#txtUserName").blur(function () {
             $.ajax({
                 url: "/ScriptServices/SharesService.asmx/CheckUserName",
                 type: "post",
                 data: "{userName:'" + $("#txtUserName").val() + "'}",
                 contentType: "application/json; charset=utf-8",
                 success: function (msg) {
                     msg = msg.d;
                     if (msg == "1") {
                         $("#txtUserName").val("");
                         $.messager.alert('系統提示', "已存在相同帳號，請換一個再重試！", 'error');
                     }
                 }
             });
         })
     })
    </script>

<script type="text/javascript">
    function historyGo() {
        history.go(-1);
    }

    //保存事件
    function OnSave() {
        var isValid = $('#form1').form('validate');
        if (!isValid) return false;

        $("[id$=hOp]").val("OnSave");

        $('#form1').submit();
    }
</script>

</asp:Content>
