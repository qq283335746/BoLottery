<%@ Page Title="我的額度" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MyPrice.aspx.cs" Inherits="TygaSoft.Web.Admin.MyPrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="easyui-panel" title="我的額度" data-options="fit:true" style="padding:10px;"> 

    <div class="row">
        <span class="fl rl">&nbsp;</span>
        <div class="fl">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="currFun.ChangePrice()">調整額度</a>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl">可用總額：</span>
        <div class="fl">
            <span id="lbTotalPrice" runat="server"></span>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl">剩余額度：</span>
        <div class="fl">
            <span id="lbRemainPrice" runat="server"></span>
        </div>
        <span class="clr"></span>
    </div>

</div>

<div id="dlg" class="easyui-dialog" title="調整額度" data-options="resizable:true,modal:true,closed:true,
buttons:[{
			text:'保存',iconCls:'icon-ok',
			handler:function(){currFun.SaveChangePrice();}
		},{
			text:'取消',iconCls:'icon-cancel',
			handler:function(){$('#dlg').dialog('close');}
		}]" 
style="width:380px;height:180px; padding:10px;">
    <div class="row">
        <span class="fl rl"> <b class="cr">*</b>調整方式：</span>
        <div class="fl">
            <select id="cbbChangeMode" class="easyui-combobox">
		        <option value="1">增加</option>
		        <option value="0">減少</option>
	        </select>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl"> <b class="cr">*</b>金額：</span>
        <div class="fl">
            <input type="text" id="txtCurrPrice" maxlength="20" class="easyui-validatebox txt" data-options="required:true,validType:'price'" style="width:70px;" />
        </div>
        <span class="clr"></span>
    </div>
</div>

<script type="text/javascript" src="/Scripts/Jeasyui.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).bind("keydown", function (e) {
            var key = e.which;
            if (key == 13) {
                currFun.Save();
            }
        })
    })
</script>

<script type="text/javascript">
    function historyGo() {
        history.go(-1);
    }

    var currFun = {
        ChangePrice: function () {
            $('#dlg').dialog('open');
        },
        SaveChangePrice: function () {

            var changeMode = $("#cbbChangeMode").combobox('getValue');
            var price = $("#txtCurrPrice").val();

            if (price.length == 0) {
                $.messager.alert('提示', "請輸入金額", 'error');
                return false;
            }

            if (!/(^\d+$)|(^(\d+)\.(\d+){1,2}$)/.test(price)) {
                $.messager.alert('提示', "請正確輸入金額", 'error');
                return false;
            }

            $.messager.confirm('温馨提醒', '確定要調整嗎？', function (r) {
                if (r) {
                    $.ajax({
                        url: "/ScriptServices/AdminService.asmx/ChangeUserPrice",
                        type: "post",
                        data: '{changeMode:' + changeMode + ',price:"' + price + '"}',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var msg = data.d;
                            if (msg == "1") {
                                window.location = window.location.href;
                                jeasyuiFun.show("温馨提示", "保存成功！");
                                $('#dlg').dialog('close');
                            }
                            else {
                                $.messager.alert('系統提示', msg, 'info');
                            }
                        }
                    });
                }
            });
        }
    }
</script>

</asp:Content>
