<%@ Page Title="規則" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="LotteryRule.aspx.cs" Inherits="TygaSoft.Web.Users.Game.LotteryRule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="box">
    <div class="h pd5">規則</div>
    <div class="c pd10">
        <asp:Literal runat="server" ID="ltrRule"></asp:Literal>
        <%--<div id="tt" class="easyui-tabs">
            <div title="八大明星战神（四十选八）" style="padding:10px;"> </div>
            <div title="十二星宫（十二选五）" style="padding:10px;display:none;"></div>
            <div title="皇家马场（二十七选三）" style="padding:10px;display:none;"></div>
        </div>--%>
    </div>
</div>

<script type="text/javascript">
    var currFun = {
        Init:function(){
        
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
