<%@ Page Title="內容管理" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListContent.aspx.cs" Inherits="TygaSoft.Web.Admin.ListContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div id="toolbar" style="padding:5px;">
    標題：<input type="text" runat="server" id="txtTitle" maxlength="256" class="txt" />
    所屬類型：<input id="txtParent" runat="server" clientidmode="Static" class="easyui-combotree" style="width:150px;" />
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="currFun.Search()">查 詢</a>

</div>

<table id="bindT" class="easyui-datagrid" title="内容管理" data-options="rownumbers:true,pagination:true,toolbar:'#toolbar',fit:true">
<thead>
    <tr>
        <th data-options="field:'f0',checkbox:true"></th>
        <th data-options="field:'f1',sortable:true">標題</th>
        <th data-options="field:'f2',sortable:true">所屬類型</th>
        <th data-options="field:'f3',sortable:true">最近更新時間</th>
    </tr>
</thead>
<tbody>
<asp:Repeater ID="rpData" runat="server">
    <ItemTemplate>
        <tr>
            <td><%#Eval("Id")%></td>
            <td><a href='AddContent.aspx?nId=<%#Eval("Id")%>'><%#Eval("Title")%></a> </td>
            <td><%#Eval("ContentTypeName")%></td>
            <td><%#Eval("LastUpdatedDate")%></td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</tbody></table>
      
<input type="hidden" id="hOp" runat="server" />
<input type="hidden" id="hV" runat="server" />

<asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

<script type="text/javascript">
    $(function () {

        $("#btnNew").click(function () {
            window.location = "AddContent.aspx";
        })
        $("#abtnNew").click(function () {
            window.location = "AddContent.aspx";
        })

        $("#abtnEdit").click(function () {
            var cbl = $('#bindT').datagrid("getSelections");
            if (cbl && cbl.length == 1) {
                window.location = "AddContent.aspx?nId=" + cbl[0].f0 + "";
            }
            else {
                $.messager.alert('錯誤提醒', '請選擇一行且僅一行進行編輯', 'error');
            }
        })

        $("#abtnDel").click(function () {
            var cbl = $('#bindT').datagrid("getSelections");
            if (!cbl || cbl.length == 0) {
                $.messager.alert('錯誤提醒', '請至少選擇一行數據再進行操作', 'error');
                return false;
            }
            $.messager.confirm('温馨提醒', '確定要刪除嗎？', function (r) {
                if (r) {
                    var itemsAppend = "";
                    var cbLen = cbl.length;
                    for (var i = 0; i < cbLen; i++) {
                        itemsAppend += cbl[i].f0 + ",";
                    }

                    $("[id$=hV]").val(itemsAppend);
                    $("[id$=hOp]").val("OnDel");

                    $('#form1').submit();
                }
            });
        })

        //所属类型
        $.ajax({
            url: "/ScriptServices/AdminService.asmx/GetJsonForContentType",
            type: "post",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var jsonData = (new Function("", "return " + data.d))();
                $('#txtParent').combotree('loadData', jsonData);
            }
        });

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
            var parentId = $("#txtParent").combotree('getValue');
            window.location = "?title=" + $("[id$=txtTitle]").val() + "&parentId=" + parentId + "";
        }
    } 
</script>

</asp:Content>
