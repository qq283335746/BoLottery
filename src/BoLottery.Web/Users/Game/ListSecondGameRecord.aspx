<%@ Page Title="我的游戏记录" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="ListSecondGameRecord.aspx.cs" Inherits="TygaSoft.Web.Users.Game.ListSecondGameRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="box">
    <div class="h pd5">我的遊戲記錄</div>
    <div class="c pd10">
        <div id="tt" class="easyui-tabs" data-options="onSelect:currFun.OnSelect">
            <div title="八大明星戰神（四十選八）" style="padding:20px;display:none;"></div>
            <div title="十二星宮（十二選五）" data-options="selected:true" style="overflow:auto;padding:10px;">
                <div id="toolbar" style="padding:5px;">
                    期號：<input type="text" runat="server" id="txtPeriod" maxlength="20" class="txt" />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="currFun.Search()">查 詢</a>
                </div>
                <table id="bindT" class="easyui-datagrid" title="" data-options="rownumbers:true,pagination:true,toolbar:'#toolbar',singleSelect:true,fitColumns:true">
                    <thead>
                        <tr>
                            <th data-options="field:'f0',hidden:true"></th>
                            <th data-options="field:'f1',width:70">期號</th>
                            <th data-options="field:'f3',width:100">投注方式</th>
                            <th data-options="field:'f4',width:70">投注内容</th>
                            <th data-options="field:'f5',width:100">投注金額</th>
                            <th data-options="field:'f6',width:130">日期</th>
                            <th data-options="field:'f7',width:100">獎金</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpData" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Id")%></td>
                                    <td><%#Eval("Period")%></td>
                                    <td><%#Eval("BetMode")%></td>
                                    <td><%#Eval("BetValue")%></td>
                                    <td><%#Eval("BetPrice")%></td>
                                    <td><%#Eval("LastUpdatedDate")%></td>
                                    <td><%#Eval("IsWin").ToString() == "True" ? Eval("WinPrice") : 0%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <div title="皇家馬場（二十七選三）" style="padding:20px;display:none;"></div>
        </div>
    </div>
</div>

<asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

<script type="text/javascript">
    var sPageIndex = 0;
    var sPageSize = 0;
    var sTotalRecord = 0;
    var sQueryStr = "";

    $(function () {
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
            window.location = "?period=" + $("[id$=txtPeriod]").val() + "";
        },
        OnSelect: function (title, index) {
            switch (index) {
                case 0:
                    window.location = "/u/yy";
                    break;
                case 2:
                    window.location = "/u/aa";
                    break;
                default:
                    break;
            }
        }
    } 
</script>

</asp:Content>
