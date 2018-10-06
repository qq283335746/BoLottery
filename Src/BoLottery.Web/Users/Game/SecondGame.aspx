<%@ Page Title="十二星宮（十二選五）" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="SecondGame.aspx.cs" Inherits="TygaSoft.Web.Users.Game.SecondGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="../../Scripts/SecondGame.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="mb10">
    <div class="fl mr10">
        <a href="javascript:void(0)" title="規則玩法未設定" class="easyui-tooltip abtn_f" id="ruleTooltip" runat="server">規則玩法</a>
    </div>
    <div id="ticketInfo" runat="server" clientidmode="Static"></div>
    <span class="clr"></span>
</div>

<div id="secondGame" class="game">
<div class="fl">
    <div id="betItemBox">
    <div id="firstArea" class="box">
      <div class="h pd5">12選5</div>
      <div class="c">
          <ul class="h_ul">
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>
            </li>
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>
                
            </li>
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">10</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">11</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl">12</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg">
                        <div class="row pdlr2"><span code="myFirstAreaRate">2.4</span>倍</div>
                    </li>
                </ul>
                <span class="clr"></span>
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
                        <span class="rl">雙码</span>
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
        <div class="h pd5">特別碼選色</div>
        <div class="c">
            <ul class="h_ul">
                <li>
                    <div class="row">
                        <span class="rl bg_cg">綠</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">2.829</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl bg_cr">紅</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">2.829</span>倍</div></li>
                <li>
                    <div class="row">
                        <span class="rl bg_cy">黃</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">2.829</span>倍</div></li>
            </ul>
            <span class="clr"></span>
        </div>
    </div>
    </div>

    <div class="mt10 pd20 bg_aa">
        <a href="javascript:void(0)" id="abtnBet" class="abtn_add" onclick="secondGame.OnAddBet()"></a>
    </div>
    <div id="selectedItems" class="bg_aa">
        <div class="bg_a pd5">
            投注項：<span id="totalSelected">0</span>
            <a href="javascript:void(0);" class="abtn_g fr" id="abtnClear" onclick="secondGame.OnBetClear()">清空</a>
            <a href="javascript:void(0);" class="abtn_g fr mr10" id="abtnDel" onclick="secondGame.OnBetDel()">删除</a>
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
                        總注數：<span id="currPeriodTotalBet">0</span><br />
                        總金額：<span id="currPeriodTotalPrice">0</span><br />
                        期  數：<span id="currPeriod" class="period">0</span>期</p>
                    <div class="arrow"></div>
                </div>
                <a href="javascript:void(0);" class="abtn_confrm" onclick="secondGame.OnBetConfrm()"></a>
            </div>
            <span class="clr"></span>
        </div>
    </div>
</div>
<div id="aboutHis">
    <div id="runHis" class="box">
        <div class="h pd5"> 開獎記錄 <span class="more"><a href="/u/gt">更多...</a></span></div>
        <ul class="h_ul">
            <li class="th mnone period">期號</li>
            <li class="th total">投注金額</li>
            <li class="th total">中獎金額</li>
        </ul>
        <span class="clr"></span>
        <asp:Literal runat="server" ID="ltrRunHis"></asp:Literal>
    </div>
    <div class="box">
        <div class="h pd5">投注記錄 <span class="more"><a href="/u/gt">更多...</a></span></div>
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
        secondGame.Init();
    })
</script>

</asp:Content>
