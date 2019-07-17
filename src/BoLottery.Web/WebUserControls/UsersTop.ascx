<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsersTop.ascx.cs" Inherits="TygaSoft.Web.WebUserControls.UsersTop" %>

<div id="header">
  <div class="w bb">
      <div class="fl">
          <a href="/u/t"><img src="/Images/logo.png" alt="英格蘭皇冠俱樂部" width="200px" height="83px" /></a>
      </div> 
      <div class="fl">
      <div class="cc"><a href="/u/t"> <span style="font-size:35px; font-weight:bold; color:#FFFF99;">英格蘭皇冠俱樂部</span></a> </div>
          <div class="pd5 aa">
              
              <ul class="h_ul">
                  <li>
                      <a href="/u/ty">歷史開獎</a>
                      <span class="pd5">|</span> 
                  </li>
                  <li>
                       <a href="/u/ga">規則</a>
                       <span class="pd5">|</span> 
                  </li>
                  <li>
                       <a href="/u/ay">2周報表</a>
                       <span class="pd5">|</span> 
                  </li>
                  <li>
                      <asp:LoginStatus ID="lsUser" runat="server" LogoutText="退出" /> 
                  </li>
              </ul>
              <span class="clr"></span>
          </div>
          <div id="nav" class="nav">
            <a href="/u/t">八大明星戰神（四十選八）</a>
            <a href="/u/y">十二星宮（十二選五）</a>
            <a href="/u/g">皇家馬場（二十七選三）</a>
          </div>
      </div>
      <span class="clr"></span>
      <div class="banner">&nbsp</div>
  </div>
</div>