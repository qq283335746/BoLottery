﻿var secondGame = {
    Init: function () {
        secondGame.Bind();
        $("#currPeriod").text($("#lbPeriod").text());
        secondGame.BetListRowFocus();
        secondGame.ShowRun();
    },
    TotalRequest: 120,
    LoadLatestGame: function () {
        var totalMls = 0;
        totalMls = $("#hTotalMls").val();
        if (totalMls <= 0) {
            try {
                $.ajax({
                    type: "POST",
                    url: "/ScriptServices/UsersService.asmx/GetLatestBySecondGame",
                    contentType: "application/json; charset=utf-8",
                    data: '',
                    success: function (data) {
                        if (data.d.length == 0) return;
                        var jsonData = (new Function("return " + data.d))();

                        $.map(jsonData, function (item) {
                            $("#lbPeriod").text(item.Period);
                            $("#currPeriod").text(item.Period);
                            $("#hTotalMls").val(item.TotalMls);
                            $("#hTicketId").val(item.TicketId);

                            $("span[code=myFirstAreaRate]").html(item.FirstAreaRate);
                            $("span[code=mySecondAreaRate]").html(item.SecondAreaRate);
                            $("span[code=myThirdAreaRate]").html(item.ThirdAreaRate);
                        })

                        secondGame.ShowRun();
                        secondGame.OnBetHisClear();

                        setTimeout(secondGame.BindRunHis, 25000);
                    }
                })
            }
            catch (e) {
                $.messager.alert('異常：', e.name + ": " + e.message, 'error');
            }
        }
    },
    BindRunHis: function () {
        try {
            $.ajax({
                type: "POST",
                url: "/ScriptServices/UsersService.asmx/BindRunHisBySecondGame",
                contentType: "application/json; charset=utf-8",
                data: '',
                success: function (data) {
                    var jsonData = (new Function("return " + data.d))();

                    var normalAppend = "";
                    var htmlAppend = "";
                    $.map(jsonData, function (item) {
                        htmlAppend += "<ul class=\"h_ul\"><li class=\"td mnone\">" + item.Period + "</li>";
                        var tickets = $.trim(item.TicketNum).split(",");
                        var normalLen = tickets.length - 1;
                        var specialNum = tickets[normalLen];
                        for (var i = 0; i < normalLen; i++) {
                            normalAppend += "<a class=\"ci_bl\">" + tickets[i] + "</a>";
                        }
                        switch (item.ColorName) {
                            case "綠":
                                normalAppend += "<a class=\"ci_gr\">" + specialNum + "</a>";
                                break;
                            case "紅":
                                normalAppend += "<a class=\"ci_rd\">" + specialNum + "</a>";
                                break;
                            case "黃":
                                normalAppend += "<a class=\"ci_yl\">" + specialNum + "</a>";
                                break;
                            default:
                                break;
                        }

                        normalAppend = "<div class=\"fr\"><span style=\"color:#D1703E;\"><span id=\"lbHisPeriod\">" + item.Period + "</span> 期開獎結果</span> " + normalAppend + "</div>";

                        htmlAppend += "<li class=\"td\">" + item.BetTotalPrice + "</li>";
                        htmlAppend += "<li class=\"td\">" + item.PayTotalPrice + "</li>";
                        htmlAppend += "</ul><span class=\"clr\"></span>";
                    })

                    var lastDiv = $("#hTicketId").next();
                    if (lastDiv.is("div")) lastDiv.remove();
                    $("#ticketInfo").append(normalAppend);

                    var $_obj = $("#runHis>ul:first").next();
                    $_obj.nextAll().remove();
                    $_obj.after(htmlAppend);

                    jsHelper.GetUserPrice();
                }
            })
        }
        catch (e) {
            $.messager.alert('異常：', e.name + ": " + e.message, 'error');
        }
    },
    ShowRun: function () {
        var totalMls = $("#hTotalMls").val();
        totalMls = totalMls - 1000;
        if (totalMls < 0) totalMls = 0;
        $("#hTotalMls").val(totalMls);
        var $_fpan = $("#ticketInfo>ul>li:last");
        if (totalMls > 0 && totalMls < 60000) {
            if (!$_fpan.is(":visible")) {
                $_fpan.show();
                $(".game").find(".txt").attr("readonly", "readonly");
            }
        }
        else {
            if ($_fpan.is(":visible")) {
                $_fpan.hide();
                $(".game").find(".txt").removeAttr("readonly");
            }
        }
        $("#lbRemainTime").text(secondGame.CreateTimeByTotalMls(totalMls));

        if (totalMls > 0) {
            setTimeout(arguments.callee, 1000);
        }
        else {
            secondGame.LoadLatestGame();
        }
    },
    CreateTimeByTotalMls: function (totalMls) {
        if (totalMls <= 0) {
            return "正在获取...";
        }
        var hour = Math.floor((totalMls / 3600000));
        totalMls = totalMls - 3600000 * hour;
        var minute = Math.floor((totalMls / 60000));
        totalMls = totalMls - minute * 60000;
        var second = Math.floor(totalMls / 1000);
        if (hour < 10) hour = "0" + hour;
        if (minute < 10) minute = "0" + minute;
        if (second < 10) second = "0" + second;

        return hour + ":" + minute + ":" + second + "";
    },
    OnAddBet: function () {
        var reg = /^\d+$/;
        var hasError = false;
        var hasValue = false;
        var itemAppend = "";
        var loopIndex = 0;
        var itemsRows = $("#betItemBox").find("[id$=Area]");
        itemsRows.each(function () {
            var $_this = $(this);
            var txts = $_this.find("[type=text]");
            txts.each(function () {
                var currItem = $(this);
                var currValue = $.trim(currItem.val());
                if ((currValue.length > 0) && !reg.test(currValue)) {
                    hasError = true;
                    $.messager.alert('错误提醒', '请正确输入投注金额', 'error');
                    return false;
                }
                if (reg.test(currValue) && (parseInt(currValue) > 0)) {
                    if (!hasValue) hasValue = true;
                    loopIndex++;
                    if (loopIndex > 1) itemAppend += "|";
                    itemAppend += $_this.children(":first").text() + "," + currItem.parent().prev().text() + "," + currValue;
                }
            })
        })

        if (hasError) {
            return false;
        }

        if (!hasValue) {
            $.messager.alert('错误提醒', '请先投注', 'error');
            return false;
        }

        var itemArr = itemAppend.split("|");
        var itemArrLen = itemArr.length;

        var t_betList = $("#t_betList");
        var rows = t_betList.children("ul").not(":first");
        var rowsLen = rows.length;
        var isNotContains = true;

        for (var i = 0; i < itemArrLen; i++) {
            var currArr = itemArr[i].split(",");
            var sAppend = "<li>" + currArr[0] + "</li><li>" + currArr[1] + "</li><li><span>" + currArr[2] + "</span>元</li>";
            rows.each(function () {
                var li_List = $(this).children();
                if ((li_List.eq(0).text() == currArr[0]) && (li_List.eq(1).text() == currArr[1])) {
                    isNotContains = false;
                    var li_Last = li_List.filter(":last").children();
                    var currPrice = parseInt(li_Last.text());
                    currPrice = currPrice + parseInt(currArr[2]);
                    li_Last.text(currPrice);
                }
            })
            if (isNotContains) {
                rowsLen++;
                var currStyle = rowsLen % 2 == 0 ? " class=\"even\"" : "";
                sAppend = "<ul" + currStyle + ">" + sAppend + "</ul><span class=\"clr\"></span>"
                t_betList.append(sAppend);
                $("#totalSelected").text(rowsLen);
            }
        }

        $("#betItemBox").find("[type=text]").val("");
        secondGame.GetTotalBetDescr();
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
            url: "/ScriptServices/UsersService.asmx/BetSecondGame",
            contentType: "application/json; charset=utf-8",
            data: '{listBetLottery:' + jsonAppend + '}',
            beforeSend: function () {
                $("#dlgPgsbar").dialog('open');
                $('#pgsBar').progressbar('setValue', 0);
                jsHelper.StartProgressbar();
            },
            complete: function () {
                $("#dlgPgsbar").dialog('close');
            },
            success: function (data) {
                var msg = data.d;

                if (msg == 1) {
                    jeasyuiFun.show("温馨提醒", "投注成功");
                    secondGame.OnAppendToBetHis();
                    secondGame.OnBetClear();
                    jsHelper.GetUserPrice();
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
    OnSecondAddBet: function () {

    },
    OnFirstAreaClear: function () {
        $("#firstArea").find("[type=text]").val("");
    },
    OnBetDel: function () {
        $("#t_betList>ul:not(:first)").filter(".curr").remove();
        secondGame.GetTotalBetDescr();
    },
    OnBetClear: function () {
        $("#t_betList>ul:not(:first)").remove();
        secondGame.GetTotalBetDescr();
    },
    OnBetHisClear: function () {
        $("#betHis tr:not(:first)").remove();
    },
    BetListRowFocus: function () {
        $("#t_betList").on("click", "ul:not(:first)>li", function () {
            var parent = $(this).parent();
            parent.addClass("curr").siblings().removeClass("curr");
        })
    },
    OnAppendToBetHis: function () {
        var rows = $("#betHis tr");
        if (rows.length > 20) {
            return;
        }
        var lastRow = rows.filter(":last");
        var htmlAppend = "";
        var betRows = $("#t_betList>ul:not(:first)");
        var index = 0;
        betRows.each(function () {
            index++;
            if (index > 20) return;
            var items = $(this).children();
            htmlAppend += "<tr><td>" + items.eq(0).text() + "</td><td>" + items.eq(1).text() + "</td><td>" + items.eq(2).text() + "</td></tr>";
        })
        if (htmlAppend.length > 0) {
            lastRow.after(htmlAppend);
        }

        secondGame.SetRowStyle("betHis");
    },
    SetRowStyle: function (id) {
        var bindT = $(document.getElementById(id));
        var trList = bindT.find("tr");
        if (trList == undefined || trList.length == 0) return;
        var $_thRow = trList.filter(":first");
        var $_tdRow = trList.filter(":not(:first)");
        $_tdRow.filter(":even").addClass("even");
        $_tdRow.hover(function () {
            $(this).css('backgroundColor', '#F5CCAE');
        }, function () {
            $(this).css('backgroundColor', '');
        })
    },
    Bind: function () {
        var hRate = $("#hRate").html();
        if (hRate != undefined && hRate.length > 0) {
            var json = eval("(" + hRate + ")");
            $.map(json, function (item) {
                $("span[code=myFirstAreaRate]").html(item.FirstAreaRate);
                $("span[code=mySecondAreaRate]").html(item.SecondAreaRate);
                $("span[code=myThirdAreaRate]").html(item.ThirdAreaRate);
            })
        }
    }
}