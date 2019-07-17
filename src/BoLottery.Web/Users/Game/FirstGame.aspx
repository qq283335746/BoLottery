<%@ Page Title="八大明星戰神（四十選八）" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="FirstGame.aspx.cs" Inherits="TygaSoft.Web.Users.Game.FirstGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="../../Scripts/FirstGame.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="mb10">
    <div class="fl mr10">
        <a href="javascript:void(0)" title="規則玩法未設定" class="easyui-tooltip abtn_f" id="ruleTooltip" runat="server">規則玩法</a>
    </div>
    <div id="ticketInfo" runat="server" clientidmode="Static"></div>
    <span class="clr"></span>
</div>

<div id="firstGame" class="game">
<div class="fl">

    <div id="betItemBox">
    <div id="firstArea" class="box">
      <div class="h pd5">40選8
          <img src="../../Images/1.jpg" width="490" height="23" alt="" />
      </div>
      <div class="c">
          <ul class="h_ul">
            <li>
                <div class="row">
                    <span class="rl">1</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">2</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">3</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">4</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">5</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">6</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">7</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">8</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">9</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">10</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">11</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">12</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">13</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">14</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">15</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">16</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">17</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">18</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">19</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">20</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">21</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">22</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">23</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">24</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">25</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">26</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">27</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">28</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">29</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">30</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">31</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">32</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">33</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">34</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">35</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
            <li>
                <div class="row">
                    <span class="rl">36</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">37</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">38</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">39</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
                <div class="row">
                    <span class="rl">40</span>
                    <div class="fl pd2">
                        <input type="text" class="txt" />
                    </div>
                    <span class="clr"></span>
                </div>
            </li>
        </ul>
          <span class="clr"></span>

      </div>
    </div>
    <div id="secondArea" class="box mt10">
        <div class="h pd5">單雙大小</div>
        <div class="c">
            <ul class="h_ul">
                <li>
                    <div class="row">
                        <span class="rl">大碼</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">0.943</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">小碼</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">0.943</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">單碼</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">0.943</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">雙碼</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">0.943</span>倍</div></li>
            </ul>
            <span class="clr"></span>
        </div>
    </div>
    <div id="thirdArea" class="box mt10">
        <div class="h pd5">區間投注</div>
        <div class="c">
            <ul class="h_ul">
                <li>
                    <div class="row">
                        <span class="rl">1-10</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">3.77</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">11-20</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">3.77</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">21-30</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">3.77</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl">31-40</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">3.77</span>倍</div></li>
            </ul>
            <span class="clr"></span>
            
        </div>
    </div>
    </div>
    <div class="mt10 pd20 bg_aa">
        <a href="javascript:void(0)" id="abtnBet" class="abtn_add" onclick="firstGame.OnAddBet()"></a>
    </div>
    <div id="selectedItems" class="bg_aa">
        <div class="bg_a pd5">
            投注項：<span id="totalSelected">0</span>
            <a href="javascript:void(0);" class="abtn_g fr" id="abtnClear" onclick="firstGame.OnBetClear()">清空</a>
            <a href="javascript:void(0);" class="abtn_g fr mr10" id="abtnDel" onclick="firstGame.OnBetDel()">删除</a>
            <span class="clr"></span>
        </div>
        <div class="pd5">
            <div id="t_betList" class="fl">
                <ul class="th">
                    <li>投注方式</li>
                    <li>投注内容</li>
                    <li>金額</li>
                </ul>
                <span class="clr"></span>
            </div>
            <div id="bet_Descr" class="fl">
                <div class="descr_box">
                    <h3>投注說明</h3>
                    <p>
                        總注数：<span id="currPeriodTotalBet">0</span><br />
                        總金额：<span id="currPeriodTotalPrice">0</span><br />
                        期  數：<span id="currPeriod" class="period">0</span>期</p>
                    <div class="arrow"></div>
                </div>
                <a href="javascript:void(0);" class="abtn_confrm" onclick="firstGame.OnBetConfrm()"></a>
            </div>
            <span class="clr"></span>
        </div>
    </div>
</div>
<div id="aboutHis">
    <div id="runHis" class="box">
        <div class="h pd5"> 開獎記錄 <span class="more"><a href="/u/ty">更多...</a></span></div>
        <ul class="h_ul">
            <li class="th mnone period">期號</li>
            <li class="th total">投注金額</li>
            <li class="th total">中獎金額</li>
        </ul>
        <span class="clr"></span>
        <asp:Literal runat="server" ID="ltrRunHis"></asp:Literal>
    </div>
    <div class="box">
        <div class="h pd5">投注記錄 <span class="more"><a href="/u/ty">更多...</a></span></div>
    </div>
    <table id="betHis" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr><th align="left">投注方式</th><th>投注内容</th><th>金額</th></tr>
        <asp:Literal ID="ltrBetHis" runat="server"></asp:Literal>
    </table>
</div>
<span class="clr"></span>
</div>

<div id="dlgPgsbar" class="easyui-dialog" title="" data-options="resizable:true,modal:true,closed:true" style="width:415px;height:36px;">
    <div id="pgsBar" class="easyui-progressbar" data-options="value:0" style="width:400px;"></div>
</div>

<asp:Literal runat="server" ID="ltrHtml"></asp:Literal>

<script type="text/javascript">
    $(function () {
        firstGame.Init();
    })
</script>

</asp:Content>
