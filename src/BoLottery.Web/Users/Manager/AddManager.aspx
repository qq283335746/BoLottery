<%@ Page Title="設置管理員" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="AddManager.aspx.cs" Inherits="TygaSoft.Web.Users.Manager.AddManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="/Scripts/JeasyuiExtend.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="box">
  <div class="h pd5">設置管理員</div>
  <div class="c pd10">
      <div class="row">
          <span class="fl rl"><b class="cr">*</b>管理員類型：</span>
          <div class="fl">
              <select id="cbbManager" runat="server" class="easyui-combobox" style="width:200px;" data-options="valueField: 'id',textField: 'text'">
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
              <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="currFun.Save()">提交</a>
          </div>
          <span class="clr"></span>
      </div>
  </div>
</div>

<input type="hidden" id="hOp" runat="server" />
<input type="hidden" id="hV" runat="server" />

 <script type="text/javascript">
     $(function () {

         currFun.Init();

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
             currFun.CbbManager();
         },
         Save: function () {
             var isValid = $('#form1').form('validate');
             if (!isValid) return false;

             $("[id$=hOp]").val("OnSave");
             $("[id$=hV]").val($("[id$=cbbManager]").combobox('getValue'));

             $('#form1').submit();
         },
         CbbManager: function () {
             var cbb = $("[id$=cbbManager]");
             $.ajax({
                 url: "/ScriptServices/UsersService.asmx/GetJsonManagers",
                 type: "post",
                 data: "",
                 contentType: "application/json; charset=utf-8",
                 success: function (data) {
                     var jsonData = (new Function("", "return " + data.d))();

                     cbb.combobox('loadData', jsonData);
                 }
             });
         }
     }
    </script>

</asp:Content>
