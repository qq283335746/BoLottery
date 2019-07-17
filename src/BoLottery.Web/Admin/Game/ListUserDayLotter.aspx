<%@ Page Title="用户当日统计" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListUserDayLotter.aspx.cs" Inherits="TygaSoft.Web.Admin.Game.ListUserDayLotter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div id="toolbar" style="padding:5px;">
    用户：<input type="text" runat="server" id="txtUserName" maxlength="50" class="txt" />
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="currFun.Search()">查 詢</a>
</div>
<table id="bindT" class="easyui-datagrid" title="" data-options="rownumbers:true,pagination:true,singleSelect:true,fitColumns:true,toolbar:'#toolbar'" style="height: auto;">
    <thead>
        <tr>
            <th data-options="field:'f1',width:100">日期</th>
            <th data-options="field:'f2',width:120">用户</th>
            <th data-options="field:'f3',width:80">当天可用总额</th>
            <th data-options="field:'f4',width:80">当天剩余额</th>
            <th data-options="field:'f5',width:80">投注总额</th>
            <th data-options="field:'f6',width:80">输赢总计</th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater ID="rpData" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("LastUpdatedDate")%></td>
                    <td><%#Eval("UserName")%></td>
                    <td><%#Eval("TotalPrice")%></td>
                    <td><%#Eval("RemainPrice")%></td>
                    <td><%#Eval("BetTotalPrice")%></td>
                    <td><%#Eval("EndTotalPrice")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>

<asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

<script type="text/javascript">
    var sPageIndex = 0;
    var sPageSize = 0;
    var sTotalRecord = 0;
    var sQueryStr = "";

    $(function () {
        var myData = currFun.GetMyData("myDataForPage");
        $.map(myData, function (item) {
            sPageIndex = parseInt(item.PageIndex);
            sPageSize = parseInt(item.PageSize);
            sTotalRecord = parseInt(item.TotalRecord);
            sQueryStr = item.QueryStr.replace(/&amp;/g, '&') ;
        })

        currFun.Init();
    })

    var currFun = {
        Init: function () {
            currFun.Grid(sPageIndex, sPageSize);
        },
        GetMyData: function (clientId) {
            var myData = $("#"+clientId+"").html();
            return eval("(" + myData + ")");
        },
        Grid: function (pageIndex, pageSize) {

            var pager = $('#bindT').datagrid('getPager');
            $(pager).pagination({
                total: sTotalRecord,
                pageNumber: sPageIndex,
                pageSize: sPageSize,
                onSelectPage: function (pageNumber, sPageSize) {
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
            window.location = "?userName=" + $.trim($("[id$=txtUserName]").val()) + "";
        }
    } 
</script>

</asp:Content>
