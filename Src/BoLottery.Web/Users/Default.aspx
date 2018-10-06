<%@ Page Title="首页" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TygaSoft.Web.Users.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="currFun.Add()">设 置</a>
</div>
<div style="margin:100px auto; width:283px;">
    <input type="text" id="txtVCode" maxlength="20" class="txt" />
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="currFun.Save()">确定</a>
</div>

<div id="dlg" class="easyui-dialog" title="设置验证码" data-options="iconCls:'icon-save',closed:true,modal:true,
buttons: [{
	    text:'保存',iconCls:'icon-ok',
	    handler:function(){
		    currFun.Save();
	    }
    },{
	    text:'取消',iconCls:'icon-cancel',
	    handler:function(){
		    $('#dlg').dialog('close');
	    }
    }]" style="width:320px;height:180px;padding:10px">

    当前密码：<input type="text" id="txtPsw" maxlength="20" class="txt" />
    设置验证码：<input type="text" id="txtSetVCode" maxlength="20" class="txt" />
    
</div>

<script type="text/javascript">
    var currFun = {
        Add: function () {
            $("#dlg").dialog('open');
        },
        Save: function () {
            
        },
        CheckVc: function () { 
        
        }
    }
</script>

</asp:Content>
