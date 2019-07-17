<%@ Page Title="累計投注總額和開獎數額" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListRealTimeTicketRun.aspx.cs" Inherits="TygaSoft.Web.Admin.Game.ListRealTimeTicketRun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<table id="bindT" class="easyui-datagrid" title="累計投注總額和開獎數額" data-options="rownumbers:true,pagination:false,singleSelect:true,fit:true">
<thead>
    <tr>
    <th data-options="field:'f1'">遊戲 游戏</th>
    <th data-options="field:'f2'">累計投注總額</th>
    <th data-options="field:'f3'">累計開獎數額</th>
    </tr>
</thead>
<tbody>
<asp:Repeater ID="rpData" runat="server">
    <ItemTemplate>
        <tr>
            <td><%#Eval("LotteryType")%></td>
            <td><%#Eval("TotalBetPrice")%></td>
            <td><%#Eval("TotalPayPrice")%></td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</tbody>
</table>

</asp:Content>
