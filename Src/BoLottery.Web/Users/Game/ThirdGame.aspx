<%@ Page Title="皇家馬場（二十七選三）" Language="C#" MasterPageFile="~/Users/Users.Master" AutoEventWireup="true" CodeBehind="ThirdGame.aspx.cs" Inherits="TygaSoft.Web.Users.Game.ThirdGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="../../Scripts/ThirdGame.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="mb10">
    <div class="fl mr10">
        <a href="javascript:void(0)" title="規則玩法未設定" class="easyui-tooltip abtn_f" id="ruleTooltip" runat="server">規則玩法</a>
    </div>
    <div id="ticketInfo" runat="server" clientidmode="Static"></div>
    <span class="clr"></span>
</div>

<div id="thirdGame" class="game">
<div class="fl">
  <div id="betItemBox">
    <div id="firstArea" class="box">
      <div class="h pd5">冠軍</div>
      <div class="c">
          <ul class="h_ul">
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

            </li>
            <li>
                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">1</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">2</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">3</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">4</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">5</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">6</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">7</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">8</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                       <div class="row">
                        <span class="rl bg_cr" code="紅">9</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                        </div> 
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>
               
            </li>
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFirstAreaRate">25倍</span></div></li>
                </ul>
                <span class="clr"></span>
            </li>
            
        </ul>
          <span class="clr"></span>

      </div>
    </div>
    <div id="secondArea" class="box mt10">
        <div class="h pd5">冠軍選色</div>
        <div class="c">
            <ul class="h_ul">
                <li>
                    <div class="row pdlr10" style="padding-right:13px;"> 冠  軍</div>
                </li>
                <li>
                    <div class="row">
                        <span class="rl bg_cb" code="黑">&nbsp;</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">2.83倍</span></div></li>
                <li>
                    <div class="row">
                        <span class="rl bg_cr" code="紅">&nbsp;</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">2.83倍</span></div></li>
                <li>
                    <div class="row">
                        <span class="rl bg_cy" code="黃">&nbsp;</span>
                        <div class="fl pd2">
                            <input type="text" class="txt" />
                        </div>
                        <span class="clr"></span>
                    </div>
                </li>
                <li class="bg_cg"><div class="row"><span code="mySecondAreaRate">2.83倍</span></div></li>
            </ul>
            <span class="clr"></span>

        </div>
    </div>
    <div id="thirdArea" class="box mt10">
        <div class="h pd5">冠軍選碼</div>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
                    </ul>
                    <span class="clr"></span>

                </li>
                <li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
                    </ul>
                    <span class="clr"></span>

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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
                    </ul>
                    <span class="clr"></span>

                </li>
                <li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
                    </ul>
                    <span class="clr"></span>

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
                         <li class="bg_cg"><div class="row"><span code="myThirdAreaRate">8.5 倍</span></div></li>
                    </ul>
                    <span class="clr"></span>
                </li>
                
            </ul>
            <span class="clr"></span>

        </div>
    </div>
    <div id="fourthArea" class="box mt10">
      <div class="h pd5">冠亞季軍選碼</div>
      <div class="c">
          <ul class="h_ul">
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cb" code="黑">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>
            </li>
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cr" code="紅">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>
            </li>
            <li>
                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">1</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">2</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">3</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">4</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">5</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">6</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">7</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">8</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>

                <ul class="h_ul">
                    <li>
                        <div class="row">
                            <span class="rl bg_cy" code="黃">9</span>
                            <div class="fl pd2">
                                <input type="text" class="txt" />
                            </div>
                            <span class="clr"></span>
                        </div>
                    </li>
                    <li class="bg_cg"><div class="row"><span code="myFourthAreaRate">8.5 倍</span></div></li>
                </ul>
                <span class="clr"></span>
            </li>
            
        </ul>
          <span class="clr"></span>
      </div>
    </div>
  </div>

    <div class="mt10 pd20 bg_aa">
        <a href="javascript:void(0)" id="abtnBet" class="abtn_add" onclick="thirdGame.OnAddBet()"></a>
    </div>
    <div id="selectedItems" class="bg_aa">
        <div class="bg_a pd5">
            投注項：<span id="totalSelected">0</span>
            <a href="javascript:void(0);" class="abtn_g fr" id="abtnClear" onclick="thirdGame.OnBetClear()">清空</a>
            <a href="javascript:void(0);" class="abtn_g fr mr10" id="abtnDel" onclick="thirdGame.OnBetDel()">删除</a>
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
                        期 數：<span id="currPeriod" class="period">0</span>期</p>
                    <div class="arrow"></div>
                </div>
                <a href="javascript:void(0);" class="abtn_confrm" onclick="thirdGame.OnBetConfrm()" disabled="disabled"></a>
            </div>
            <span class="clr"></span>
        </div>
    </div>
</div>
<div id="aboutHis">
    <div id="runHis" class="box">
        <div class="h pd5"> 開獎記錄 <span class="more"><a href="/u/gy">更多...</a></span></div>
        <ul class="h_ul">
            <li class="th mnone period">期號</li>
            <li class="th total">投注金額</li>
            <li class="th total">中獎金額</li>
        </ul>
        <span class="clr"></span>
        <asp:Literal runat="server" ID="ltrRunHis"></asp:Literal>
    </div>
    <div class="box">
        <div class="h pd5">投注記錄 <span class="more"><a href="/u/aa">更多...</a></span></div>
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
        thirdGame.Init();
    })
</script>

</asp:Content>
