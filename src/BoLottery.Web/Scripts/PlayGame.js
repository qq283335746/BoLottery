
var playGame = {
    Init: function () {
        playGame.Load();
        playGame.BetBtn();
        playGame.OnFixPosition();
        playGame.OnBetListClick();
    },
    Load: function () {
        var period = $("#hPeriod").val();
        $(".period").text(period);
        var totalMls = $("#hPeriodTimeout").val();
        playGame.GetPeriodTimeoutStr(totalMls);
        playGame.TimeRunObj = setInterval(playGame.setTimeRun, 1000);
    },
//    ReLoad: function () {
//        $.ajax({
//            type: "POST",
//            url: "/ScriptServices/SharesService.asmx/BetForHainanLottery",
//            contentType: "application/json; charset=utf-8",
//            data: '{listBetHainanLottery:' + jsonAppend + '}',
//            success: function (data) {
//                var msg = data.d;

//                if (msg == 1) {
//                    jeasyuiFun.show("温馨提醒", "投注成功");
//                }
//                else if (msg == 11) {

//                }
//                else {
//                    $.messager.alert('错误提醒', msg, 'error');
//                }
//            }
//        })
//        var period = $("#hPeriod").val();
//        $(".period").text(period);
//        var totalMls = $("#hPeriodTimeout").val();
//        playGame.GetPeriodTimeoutStr(totalMls);
//        playGame.TimeRunObj = setInterval(playGame.setTimeRun, 1000);
//    },
    OnLogin: function () {
        var msg = jsHelper.OnDlgLogin();
        if (msg == 1) {
            jeasyuiFun.show("温馨提醒", "登录成功");
            $('#dlg').dialog('close');
        }
        else {
            $.messager.alert('系统提示', msg, 'info');
            return false;
        }
    },
    BetBtn: function () {
        $("#betItems .icon_b").click(function () {
            var currObj = $(this);
            var parentObj = $(this).parent();
            if (currObj.hasClass("icon_b")) {
                currObj.removeClass("icon_b").addClass("icon_a").siblings().removeClass("icon_a").addClass("icon_b");
            }
            else {
                currObj.removeClass("icon_a").addClass("icon_b");
            }
        })
    },
    OnAddBet: function () {
        var fixName = $("[id^=fix]").filter("[class*=curr]").text();
        var isFix = fixName == "定位";
        var numAppend = "";
        var isTotalRight = 0;
        var itemrRows = $("#betItems>.row");
        itemrRows.each(function () {
            var currItem = $(this).find(".icon_a");
            if (currItem.length > 0) {
                isTotalRight++;
                numAppend += currItem.text();
            }
            else {
                if (isFix) {
                    numAppend = numAppend + "X";
                }
            }
        })
        if ((isTotalRight < 3) || (isTotalRight > 4)) {
            $.messager.alert('错误提醒', '请选3数或4数进行投注', 'error');
            return false;
        }
        if (fixName == "头奖") {
            if (isTotalRight != 4) {
                $.messager.alert('错误提醒', '头奖必须是4数', 'error');
                return false;
            }
        }
        if ((isTotalRight == 4) && (fixName != "头奖")) {
            $.messager.alert('错误提醒', '4数只能选择头奖', 'error');
            return false;
        }
        var txtBetNum = $("#txtBetNum");
        var sPrice = $.trim(txtBetNum.val());
        if (!(/\d+/.test(sPrice))) {
            $.messager.alert('错误提醒', '请正确输入投注金额', 'error');
            return false;
        }
        var price = parseInt(sPrice);
        var playMode = "";

        if (isTotalRight == 4) {
            playMode = "头奖";
        }
        else {
            playMode = "" + isTotalRight + "数" + fixName + "";
        }
        var sAppend = "<li>" + playMode + "</li><li>" + numAppend + "</li><li><span>" + sPrice + "</span>元</li>"
        var t_betList = $("#t_betList");
        var rows = t_betList.children("ul").not(":first");
        var rowsLen = rows.length;
        var isNotContains = true;
        rows.each(function () {
            var li_List = $(this).children();
            if ((li_List.eq(0).text() == playMode) && (li_List.eq(1).text() == numAppend)) {
                isNotContains = false;
                var li_Last = li_List.filter(":last").children();
                var currPrice = li_Last.text();
                currPrice = parseInt(currPrice) + price;
                li_Last.text(currPrice);
            }
        })
        if (isNotContains) {
            rowsLen++;
            var currStyle = rowsLen % 2 == 0 ? " class=\"even\"" : "";
            var sAppend = "<ul" + currStyle + ">" + sAppend + "</ul><span class=\"clr\"></span>"
            t_betList.append(sAppend);
            $("#totalSelected").text(rowsLen);
        }

        $("#betItems .icon_a").removeClass("icon_a").addClass("icon_b");
        playGame.GetTotalBetDescr();
    },
    OnFixPosition: function () {
        var items = $("[id^=fix]");
        items.click(function () {
            $(this).addClass("curr").siblings("[id^=fix]").removeClass("curr");
        })
    },
    OnIncrease: function () {
        var txtBetNum = $("#txtBetNum");
        var sBetNum = $.trim(txtBetNum.val());
        if (!(/\d+/.test(sBetNum))) {
            txtBetNum.val(1);
            return false;
        }
        txtBetNum.val(parseInt(sBetNum) + 1);
    },
    OnDecrease: function () {
        var txtBetNum = $("#txtBetNum");
        var sBetNum = $.trim(txtBetNum.val());
        if (!(/\d+/.test(sBetNum))) {
            txtBetNum.val(1);
            return false;
        }
        var n = parseInt(sBetNum) - 1;
        if (n < 1) n = 1;
        txtBetNum.val(n);
    },
    OnBetListClick: function () {
        $("#t_betList").on("click", "ul:not(:first)>li", function () {
            var parent = $(this).parent();
            parent.addClass("curr").siblings().removeClass("curr");
        })
    },
    OnBetClear: function () {
        $("#t_betList>ul:not(:first)").remove();
        playGame.GetTotalBetDescr();
    },
    OnBetDel: function () {
        $("#t_betList>ul:not(:first)").filter(".curr").remove();
        playGame.GetTotalBetDescr();
    },
    OnBetConfrm: function () {
        var items = $("#t_betList>ul:not(:first)");
        var jsonAppend = "";
        var index = -1;
        var currAppend = "";
        items.each(function () {
            var liList = $(this).children();
            index++;
            if (index > 0) currAppend += ",";
            currAppend += "{TicketId:'" + $("#hTicketId").val() + "', BetMode:'" + liList.eq(0).text() + "',BetValue:'" + liList.eq(1).text() + "',BetPrice:'" + liList.eq(2).children().text() + "'}";
        })

        if (currAppend.length == 0) {
            $.messager.alert('错误提醒', '请先添加投注项', 'error');
            return false;
        }

        jsonAppend = "[" + currAppend + "]";

        $.ajax({
            type: "POST",
            url: "/ScriptServices/SharesService.asmx/BetLottery",
            contentType: "application/json; charset=utf-8",
            data: '{listBetLottery:' + jsonAppend + '}',
            success: function (data) {
                var msg = data.d;

                if (msg == 1) {
                    jeasyuiFun.show("温馨提醒", "投注成功");
                    playGame.OnBetClear();
                    $("#dlg").dialog('close');
                }
                else if (msg == 11) {
                    $("#dlg").dialog('open');
                }
                else {
                    $.messager.alert('系统提示', msg, 'info');
                }
            }
        })

        return false;
    },
    GetTotalBetDescr: function () {
        var betTotalNum = 0;
        var betTotalPrice = 0;
        var items = $("#t_betList>ul:not(:first)");
        items.each(function () {
            betTotalNum++;
            var liList = $(this).children();
            betTotalPrice = betTotalPrice + parseInt(liList.eq(2).children().text());
        })

        $("#currPeriodTotalBet").text(betTotalNum);
        $("#currPeriodTotalPrice").text(betTotalPrice + "元");
    },
    GetPeriodTimeoutStr: function (totalMls) {
        var sAppend = "";
        var hour = Math.floor((totalMls / 3600000));
        var sHour = hour;
        if (sHour < 10) sHour = "0" + sHour;
        sAppend += sHour;
        var minute = hour * 3600000;
        minute = (totalMls - minute) / 60000;
        minute = Math.floor(minute);
        var sMinute = minute;
        if (sMinute < 10) sMinute = "0" + sMinute;
        sAppend += ":" + sMinute;
        var second = hour * 3600000 + minute * 60000;
        second = (totalMls - second) / 1000;
        second = Math.floor(second);
        var sSecond = second;
        if (sSecond < 10) sSecond = "0" + sSecond;
        sAppend += ":" + sSecond;

        return sAppend;
    },
    TimeRunObj: null,
    setTimeRun: function () {
        var totalMls = $("#hPeriodTimeout").val();
        if (totalMls == 0) {
            clearInterval(playGame.TimeRunObj);
            return;
        }
        totalMls = totalMls - 1000;
        if (totalMls < 0) {
            totalMls = 0
        }
        $("#hPeriodTimeout").val(totalMls);
        $("#lbPeriodTimeout").text(playGame.GetPeriodTimeoutStr(totalMls));
    }
}