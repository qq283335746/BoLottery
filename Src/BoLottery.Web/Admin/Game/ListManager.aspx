<%@ Page Title="已設置的管理員" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListManager.aspx.cs" Inherits="TygaSoft.Web.Admin.Game.ListManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div id="toolbar" style="padding:5px;">
    帳號：<input type="text" runat="server" id="txtUserName" maxlength="50" class="txt" />
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="currFun.Search()">查 詢</a>
    <a href="AddManager.aspx" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加管理員</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="currFun.Add()">設置額度</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="currFun.OnIsApproved()">啟用/禁用管理員</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="currFun.RemoveScore()">清空積分</a>
</div>

<table id="bindT" class="easyui-datagrid" title="已設置的管理員列表" data-options="rownumbers:true,pagination:true,singleSelect:true,toolbar:'#toolbar',fit:true">
<thead>
    <tr>
    <th data-options="field:'f0',hidden:true"></th>
    <th data-options="field:'f1'">帳號</th>
    <th data-options="field:'f2'">額度</th>
    <th data-options="field:'f3'">剩余額度</th>
    <th data-options="field:'f6'">積分</th>
    <th data-options="field:'f4'">管理員類型</th>
    <th data-options="field:'f5'">狀態</th>
    </tr>
</thead>
<tbody>
<asp:Repeater ID="rpData" runat="server">
    <ItemTemplate>
        <tr>
            <td><%#Eval("UserId")%></td>
            <td><%#Eval("UserName")%></td>
            <td><%#Eval("TotalPrice")%></td>
            <td><%#Eval("RemainPrice")%></td>
            <td><%#Eval("TotalScore")%></td>
            <td><%#Eval("RoleName")%></td>
            <td>
                <%#Eval("IsApproved").ToString() == "False" ? "禁用" : "啟用"%>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</tbody>
</table>

<div id="dlg" class="easyui-dialog" title="設置額度" data-options="resizable:true,modal:true,closed:true,
buttons:[{
			text:'保存',iconCls:'icon-ok',
			handler:function(){currFun.Save();}
		},{
			text:'取消',iconCls:'icon-cancel',
			handler:function(){$('#dlg').dialog('close');}
		}]" 
style="width:380px;height:180px; padding:10px;">
    <div class="row">
        <span class="fl rl"> <b class="cr">*</b>帳號：</span>
        <div class="fl">
            <span id="lbUserName"></span>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row mt10">
        <span class="fl rl"> <b class="cr">*</b>操作方式：</span>
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
    <input type="hidden" id="hUserId" value="" />
</div>

<asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

<script type="text/javascript">
    var sPageIndex = 0;
    var sPageSize = 0;
    var sTotalRecord = 0;
    var sQueryStr = "";

    $(function () {
        $("#btnNew").click(function () {
            window.location = "AddManager.aspx";
        })
        $("#abtnNew").click(function () {
            window.location = "AddManager.aspx";
        })

        var myData = currFun.GetMyData();
        $.map(myData, function (item) {
            sPageIndex = parseInt(item.PageIndex);
            sPageSize = parseInt(item.PageSize);
            sTotalRecord = parseInt(item.TotalRecord);
            sQueryStr = item.QueryStr.replace(/&amp;/g, '&');
        })

        currFun.Init();
    })

    var currFun = {
        Init: function () {
            currFun.Grid(sPageIndex, sPageSize);
        },
        GetMyData: function () {
            var myData = $("#myDataForPage").html();
            return eval("(" + myData + ")");
        },
        Grid: function (pageIndex, pageSize) {
            var pager = $('#bindT').datagrid('getPager');
            $(pager).pagination({
                total: sTotalRecord,
                pageNumber: sPageIndex,
                pageSize: sPageSize, 
                onSelectPage: function (pageNumber, pageSize) {
                    if (sQueryStr.length == 0) {
                        window.location = "?pageIndex=" + pageNumber + "&pageSize=" + pageSize + "";
                    }
                    else {
                        window.location = "?" + sQueryStr + "&pageIndex=" + pageNumber + "&pageSize=" + pageSize + "";
                    }
                }
            });
        },
        Search: function () {
            window.location = "?name=" + $("[id$=txtUserName]").val() + "";
        },
        OnIsApproved: function () {
            var dg = $('#bindT');
            var currRow = dg.datagrid("getSelected");
            if (!currRow || currRow.length == 0) {
                $.messager.alert('錯誤提示', '請至少選擇一行數據再進行操作', 'error');
                return false;
            }
            var rowIndex = dg.datagrid('getRowIndex', currRow);
            $.ajax({
                url: "/ScriptServices/UsersService.asmx/SaveIsApproved",
                type: "post",
                data: "{userName:'" + currRow.f1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (msg) {
                    msg = msg.d;
                    if ((msg == "1") || (msg == "0")) {
                        var statusText = "啟用";
                        if (msg == "0") statusText = "禁用";
                        dg.datagrid('updateRow', {
                            index: rowIndex,
                            row: {
                                f5: statusText
                            }
                        })
                        jeasyuiFun.show("温馨提醒", "保存成功");
                    }
                    else {
                        $.messager.alert('錯誤提示', msg, 'error');
                    }
                }
            });
        },
        Add: function (h) {
            var row = $('#bindT').datagrid("getSelected");
            if (!row || row.length == 0) {
                $.messager.alert('錯誤提示', '請至少選擇一行數據再進行操作', 'error');
                return false;
            }
            $("#lbUserName").text(row.f1);
            $("#hUserId").val(row.f0);
            $('#dlg').dialog('open');
        },
        Save: function () {

            var dg = $('#bindT');
            var currRow = dg.datagrid("getSelected");
            var rowIndex = dg.datagrid('getRowIndex', currRow);

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

            $.messager.confirm('温馨提醒', '確定要執行操作嗎？', function (r) {
                if (r) {
                    $.ajax({
                        url: "/ScriptServices/UsersService.asmx/ChangeUserPrice",
                        type: "post",
                        data: '{userId:"' + $("#hUserId").val() + '",changeMode:' + changeMode + ',price:"' + price + '"}',
                        contentType: "application/json; charset=utf-8",
                        success: function (msg) {
                            msg = msg.d;
                            if (msg == "1") {
                                window.location = window.location.href;
                                jeasyuiFun.show("温馨提醒", "保存成功");
                                $('#dlg').dialog('close');
                            }
                            else {
                                $.messager.alert('錯誤提示', msg, 'error');
                            }
                        }
                    });
                }
            });
        },
        RemoveScore: function () {
            var dg = $('#bindT');
            var row = dg.datagrid("getSelected");
            if (!row || row.length == 0) {
                $.messager.alert('錯誤提示', '請至少選擇一行數據再進行操作', 'error');
                return false;
            }
            if (parseInt(row.f6) <= 0) {
                $.messager.alert('錯誤提示', '該管理員沒有積分！', 'error');
                return false;
            }
            var rowIndex = dg.datagrid('getRowIndex', row);
            $.messager.confirm('錯誤提示', '確定要清空該管理員的積分嗎？', function (r) {
                if (r) {
                    $.ajax({
                        url: "/ScriptServices/AdminService.asmx/ClearUserScore",
                        type: "post",
                        data: "{userId:'" + row.f0 + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (msg) {
                            msg = msg.d;
                            if (msg == "1") {
                                dg.datagrid('updateRow', {
                                    index: rowIndex,
                                    row: {
                                        f6: 0
                                    }
                                })
                                jeasyuiFun.show("温馨提醒", "保存成功");
                            }
                            else {
                                $.messager.alert('錯誤提示', msg, 'error');
                            }
                        }
                    });
                }
            });
        }
    } 
</script>

</asp:Content>
