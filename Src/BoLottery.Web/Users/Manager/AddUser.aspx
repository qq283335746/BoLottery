<%@ Page Title="設置用戶" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="TygaSoft.Web.Users.Manager.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="/Scripts/JeasyuiExtend.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="box">
  <div class="h pd5">設置用戶</div>
  <div class="c pd10">
      <div class="row">
          <span class="fl rl"><b class="cr">*</b>帳號：</span>
          <div class="fl">
              <input type="text" runat="server" id="txtUserName" clientidmode="Static" maxlength="50"  tabindex="1" class="easyui-validatebox txt" data-options="required:true" />
          </div>
          <span class="clr"></span>
      </div>
      <div class="row mt10">
          <span class="fl rl"><b class="cr">*</b>設置密碼：</span>
          <div class="fl">
              <input type="password" runat="server" id="txtPsw" clientidmode="Static" maxlength="50" tabindex="2" class="easyui-validatebox txt" data-options="required:true,validType:'psw'" />
          </div>
          <span class="clr"></span>
      </div>
      <div class="row mt10">
          <span class="fl rl"><b class="cr">*</b>確認密碼：</span>
          <div class="fl">
              <input type="password" runat="server" id="txtCfmPsw" maxlength="50" tabindex="3" class="easyui-validatebox txt" data-options="required:true" validType="cfmPsw['#txtPsw']" />
          </div>
          <span class="clr"></span>
      </div>
      <div class="row mt10">
          <span class="fl rl">&nbsp;</span>
          <div class="fl">
              <a href="javascript:void(0)" class="easyui-linkbutton" tabindex="5" data-options="iconCls:'icon-save'" onclick="currFun.Save()">提交</a>
          </div>
          <span class="clr"></span>
      </div>
  </div>
</div>

<input type="hidden" id="hOp" runat="server" />

<script type="text/javascript">
    $(function () {

        $(document).bind("keydown", function (e) {
            var key = e.which;
            if (key == 13) {
                currFun.Save();
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
                        $.messager.alert('系統提示', "已存在相同帳號，請換一個再重試", 'error');
                    }
                }
            });
        })
    })

    var currFun = {
        Init: function () {

        },
        Save: function () {
            var isValid = $('#form1').form('validate');
            if (!isValid) return false;

            $("[id$=hOp]").val("OnSave");

            $('#form1').submit();
        }
    }
</script>

</asp:Content>
