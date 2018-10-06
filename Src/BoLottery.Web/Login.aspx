<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TygaSoft.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录</title>
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/plugins/jeasyui/themes/gray/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/plugins/jeasyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="Styles/ui-v1.0.1.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Login.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Scripts/plugins/jeasyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="Scripts/plugins/jeasyui/locale/easyui-lang-zh_TW.js" type="text/javascript"></script>
    <script src="Scripts/JeasyuiHelper.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="w login">
        <div class="main">
            <div class="loginl">
	            <img src="/Images/loginl.jpg" alt="" />
            </div>
            <div class="loginr">
                
                <h1>登录</h1>
                <div id="loginInfo" class="content">
                    <div class="control-group">
			            <div class="warning clearfix" style="display:none;">
				            <span class="warning-ico"></span>
				            <span class="warning-con">用户名不能为空</span>
			            </div>
		            </div>
                    <div class="control-group">
                        <label class="placeholder" style="position: absolute; left: 5px; top: 0px; color: rgb(119, 119, 119); height: 40px; line-height: 40px; display:block;">用户名</label>
                        <input type="text" id="txtUserName" name="txtUserName" tabindex="1" maxlength="50" class="ui-input-h40" placeholder="" autocomplete="off" value="" />
                    </div>
                    <div class="control-group">
                        <label class="placeholder" style="position:absolute;left:5px;top:0px;color:#777777;height:40px;line-height:40px;display: block;">密码</label>
                        <input type="password" id="txtPsw" name="txtPsw" tabindex="2" maxlength="30" class="ui-input-h40" placeholder="" autocomplete="off" />
                    </div>
                    <div class="control-group">
                        <label class="placeholder" style="position:absolute;left:5px;top:0px;color:#777777;height:40px;line-height:40px;display: block;">验证码</label>
                        <input type="text" id="txtVc" name="txtVc" maxlength="4" tabindex="3" class="ui-input-h40" placeholder="" autocomplete="off" style="width:100px;" />
                        <img border="0" id="imgCode" src="Handlers/ValidateCode.ashx?vcType=login" alt="看不清，单击换一张" onclick="this.src='Handlers/ValidateCode.ashx?vcType=login&abc='+Math.random()" style="vertical-align:middle;line-height: 38px;height: 38px; width:100px; margin-bottom:3px;" />
                    </div>
                    <div class="control-group login-d">
		                <label class="label">&nbsp;</label>
		                <div class="fl">
		                <input type="checkbox" class="fl" id="cbRememberMe" name="cbRememberMe" value="0" onclick="if(this.checked == true){this.value='1';}else{this.value='0';}" /><label class="fl" for="remember_me">记住用户名</label>			
		                </div>	

	                </div>
                    <div class="control-group">
                        <input type="submit" class="ui-submit-blue" id="btn-submit" value="登录" />
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <span class="clr"></span>
    <div class="agreeBox">
        <div class="agreement">
            <h3>协议内容</h3>
            <div class="lst">
                <p style="line-height:24px;">
                    1，使用本公司網站的客戶，請留意閣下所在的國家或居住地的相關法律規定，如有疑問應就相關問題，尋求當地法律意見。<br />
                    2、若發生遭駭客入侵破壞行為或不可抗拒之災害導致網站故障或資料損壞、資料丟失等情況，我們將以本公司之後備資料為最後處理依據；為確保各方利益，請各會員投注後列印資料。本公司不會接受沒有列印資料的投訴。<br />
                    3、為避免糾紛，各會員在投注之後，務必進入下注狀況檢查及列印資料。若發現任何異常，請立即與代理商聯繫查證，一切投注將以本公司資料庫的資料為准，不得異議。如出现特殊网络情况或线路不稳定导致不能下注或下注失败。本公司概不负责。<br />
                    4、單一注單最高派彩上限為一百萬。<br />
                    5、開獎結果以英国官方和中國官方的公佈結果為准。<br />
                    6、我們將竭力提供準確而可靠的開獎統計等資料，但並不保證資料絕對無誤，統計資料只供參考，並非是對客戶行為的指引，本公司也不接受關於統計數據產生錯誤而引起的相關投訴。<br />
                    7,本公司擁有一切判決及註消任何涉嫌以非正常方式下註之權利，在進行更深入調查期間將停止發放與其有關之任何彩金。客戶有責任確保自己的帳戶及密碼保密，如果客戶懷疑自己的資料被盜用，應立即通知本公司，並須更改其個人詳細資料。所有被盜用帳號之損失將由客戶自行負責。在某種特殊情況下，客人之信用額可能會出現透支。<br />

                </p>
        
            </div>
            <div style="text-align:right;">“英格蘭皇家俱樂部”管理層 敬啟</div>
            <div style="text-align:right;">我瞭解以及同意下註列明的協定和規則。</div>
        </div>
        <div style="width:60px; margin:10px auto;">
            <input type="checkbox" id="cbAgree" checked="checked" />&nbsp;同意
        </div>
    </div>
    
    <span class="clr"></span>
    <div class="footer">
        <div class="footerMain">
            <span>©  2014-2014</span>
        </div>
    </div>

    <asp:Literal runat="server" ID="ltrMyData"></asp:Literal>

    </form>

    <script type="text/javascript">
        $(function () {
            currFun.Init();

            $("#form1").submit(function () {
                var sUserName = $.trim($("#txtUserName").val());
                if (sUserName == "") {
                    $(".warning-con").html("用户名不能为空");
                    $(".warning").show();
                    return false;
                }
                var sPsw = $.trim($("#txtPsw").val());
                if (sPsw == "") {
                    $(".warning-con").html("密码不能为空");
                    $(".warning").show();
                    return false;
                }
                var sVc = $.trim($("#txtVc").val());
                if (sVc == "") {
                    $(".warning-con").html("验证码不能为空");
                    $(".warning").show();
                    return false;
                }
                if (sVc.length != 4) {
                    $(".warning-con").html("请输入4位的验证码");
                    $(".warning").show();
                    return false;
                }
                if (!$("#cbAgree").is(":checked")) {
                    $(".warning-con").html("请同意协议");
                    $(".warning").show();
                    return false;
                }
                $(".warning").hide();
                $("#btn-submit").val("正在登录...");
            });
            $(".placeholder").click(function () {
                $(this).next().focus();
            })
            $("#loginInfo .ui-input-h40").focusin(function () {
                $(this).prev().hide();
            })
            $("#loginInfo .ui-input-h40").focusout(function () {
                if ($.trim($(this).val()) == "") {
                    $(this).prev().show();
                }
            })
            $("#cbRememberMe").click(function () {
                $("#btn-submit").focus();
            })
            $("#cbAgree").click(function () {
                $("#btn-submit").focus();
            })
        })

        var currFun = {
            Init: function () {
                var myData = $("#myData").html();
                if (myData != undefined && myData.length > 0) {
                    var json = eval("(" + myData + ")");
                    $.map(json, function (item) {
                        $("#txtUserName").val(item.UserName);
                        $("#txtUserName").prev().hide();
                        $("#cbRememberMe").attr("checked", "checked");
                    })
                }
            }
        }
    </script>
</body>
</html>
