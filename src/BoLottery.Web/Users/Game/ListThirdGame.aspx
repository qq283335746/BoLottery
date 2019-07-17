<%@ Page Title="皇家馬場（二十七選三））開獎歷史" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="ListThirdGame.aspx.cs" Inherits="TygaSoft.Web.Users.Game.ListThirdGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="box">
    <div class="h pd5">歷史開獎</div>
    <div class="c pd10">
        <div id="tt" class="easyui-tabs" data-options="onSelect:currFun.OnSelect">
            <div title="八大明星戰神（四十選八）" style="padding:20px;display:none;"></div>
            <div title="十二星宮（十二選五）" style="padding:20px;display:none;"></div>
            <div title="皇家馬場（二十七選三）" data-options="selected:true" style="padding:10px;">
                <div id="toolbar" style="padding:5px;">
                    期號：<input type="text" runat="server" id="txtPeriod" maxlength="20" class="txt" />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="currFun.Search()">查 詢</a>
                </div>
                <table id="bindT" class="easyui-datagrid" title="" data-options="rownumbers:true,pagination:true,singleSelect:true,fitColumns:true,toolbar:'#toolbar'" style="height: auto;">
                    <thead>
                        <tr>
                            <th data-options="field:'ColorName',hidden:true"></th>
                            <th data-options="field:'f1',width:70">期號</th>
                            <th data-options="field:'f2',width:100">投注总額</th>
                            <th data-options="field:'f3',width:100">中奖总額</th>
                            <th data-options="field:'f4',width:110">開獎時間</th>
                            <th data-options="field:'f5',width:150,formatter:currFun.FormatLottery">開獎結果</th>
                            <th data-options="field:'f6',width:70">開獎狀態</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpData" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("ColorName")%>
                                    </td>
                                    <td>
                                        <%#Eval("Period")%>
                                    </td>
                                    <td><%#Eval("BetTotalPrice")%></td>
                                    <td><%#Eval("PayTotalPrice")%></td>
                                    <td><%#string.Format("{0:yyyy-MM-dd HH:mm}",Eval("RunDate"))%></td>
                                    <td><%#Eval("TicketNum")%></td>
                                    <td><%#Eval("Status").ToString() == "1" ? "已開獎":"未開獎"%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
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
                pageSize: sPageSize,  //每页显示的记录条数，默认为10  
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
        FormatLottery: function (value, row, index) {
            var itemAppend = "";
            var items = value.split(",");
            var len = items.length;
            for (var i = 0; i < len; i++) {
                var currArr = items[i].split("-");
                switch (currArr[0]) {
                    case "黑":
                        itemAppend += "<a class=\"ci_bl\">" + currArr[1] + "</a>";
                        break;
                    case "紅":
                        itemAppend += "<a class=\"ci_rd\">" + currArr[1] + "</a>";
                        break;
                    case "黃":
                        itemAppend += "<a class=\"ci_yl\">" + currArr[1] + "</a>";
                        break;
                    default:
                        break;
                }
            }

            return itemAppend;
        },
        OnSelect: function (title, index) {
            switch (index) {
                case 0:
                    window.location = "/u/ty";
                    break;
                case 1:
                    window.location = "/u/gt";
                    break;
                default:
                    break;
            }
        }
    } 
</script>

</asp:Content>
