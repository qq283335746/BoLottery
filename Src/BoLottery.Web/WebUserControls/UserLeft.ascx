<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserLeft.ascx.cs" Inherits="TygaSoft.Web.WebUserControls.UserLeft" %>

<div id="userInfo">
    <div class="h">會員信息</div>
    <div class="row">
        <span class="rl">帳戶</span>
        <div class="fl ml10">
            <asp:LoginName ID="lnUser" runat="server"/>
        </div>
        <span class="clr"></span>
    </div>
    <div class="row">
        <span class="rl">可用總額</span>
        <div class="fl ml10"><span id="lbUserTotalPrice">0</span></div>
        <span class="clr"></span>
    </div>
    <div class="row">
        <span class="rl">剩餘額度</span>
        <div class="fl ml10"><span id="lbRemainPrice">0</span></div>
        <span class="clr"></span>
    </div>
    <div id="showScoreRow" class="row" style="display:none;">
        <span class="rl">積分</span>
        <div class="fl ml10"><span id="lbScore">0</span></div>
        <span class="clr"></span>
    </div>
</div>
<ul id="westTree" class="easyui-tree"></ul>

<asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

<script type="text/javascript">
    $(function () {
        jsHelper.GetUserPrice();
    })
</script>