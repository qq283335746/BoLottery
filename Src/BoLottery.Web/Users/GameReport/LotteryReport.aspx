<%@ Page Title="2周報表" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="LotteryReport.aspx.cs" Inherits="TygaSoft.Web.Users.GameReport.LotteryReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<table id="bindT" class="easyui-datagrid" title="2周报表" data-options="rownumbers:true,singleSelect:true,fitColumns:true,onLoadSuccess: currFun.OnLoadSuccess,rowStyler:currFun.RowStyler">
<thead>
    <tr>
        <th data-options="field:'BetDate',width:100">日 期</th>
        <th data-options="field:'BetTotalPrice',width:100">投注总额</th>
        <th data-options="field:'EndTotalPrice',width:100">输赢总计</th>
    </tr>
</thead>
<tbody>
    <asp:Repeater ID="rpData" runat="server">
        <ItemTemplate>
            <tr>
                <td>
                    <%#Eval("BetDate")%>
                </td>
                <td>
                    <%#Eval("BetTotalPrice")%>
                </td>
                <td><%#Eval("EndTotalPrice")%></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    
</tbody>
</table>

<script type="text/javascript">
    $(function () {
    })

    var currFun = {
        Init: function () {

        },
        OnLoadSuccess: function (data) {
            var merges = [{
                index: 0,
                colspan: 3
            }, {
                index: 8,
                colspan: 3
            }, {
                index: 9,
                colspan: 3
            }, {
                index: 10,
                colspan: 3
            }, {
                index: 18,
                colspan: 3
            }, {
                index: 19,
                colspan: 3
            }];
            for (var i = 0; i < merges.length; i++) {
                $(this).datagrid('mergeCells', {
                    index: merges[i].index,
                    field: 'BetDate',
                    colspan: merges[i].colspan
                });
            }
        },
        RowStyler: function (index, row) {
            switch (index) {
                case 0:
                    return "text-align:center;";
                    break;
                case 10:
                    return "text-align:center;";
                    break;
                default:
                    break;
            }
        },
        GetPriceByRate: function (curr) {
            var currObj = $(curr);
            var totalPrice = currObj.siblings(":hidden").val();
            var sRate = currObj.siblings(":text").val();

            var reg = /^(\d+)(\.\d+)?$/;
            if (!reg.test(sRate)) {
                $.messager.alert('錯誤提示', '請輸入正確的百分比數值', 'error');
                return false;
            }
            if (totalPrice == 0) return false;
            sRate = sRate / 100;
            var rateTotalPrice = totalPrice * sRate;
            rateTotalPrice = rateTotalPrice.toFixed(2);
            currObj.siblings("span").text(rateTotalPrice);
        }
    }
</script>

</asp:Content>
