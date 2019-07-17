var firstGame = {
    Init: function () {
        firstGame.Bind();
        firstGame.SetRowStyle("betHis");
        $("#currPeriod").text($("#lbPeriod").text());
        firstGame.BetListRowFocus();
        firstGame.ShowRun();
    },
    TotalRequest: 120,
    LoadLatestGame: function () {

        var totalMls = 0;
        totalMls = $("#hTotalMls").val();
        if (totalMls <= 0) {
            try {
                $.ajax({
                    type: "POST",
                    url: "/ScriptServices/UsersService.asmx/GetLatestByFirstGame",
                    contentType: "application/json; charset=utf-8",
                    data: '',
                    success: function (data) {
                        var jsonData = (new Function("return " + data.d))();

                        $.map(jsonData, function (item) {
                            $("#lbPeriod").text(item.Period);
                            $("#currPeriod").text(item.Period);
                            $("#hTotalMls").val(item.TotalMls);
                            $("#hTicketId").val(item.TicketId);

                            $("span[code=mySecondAreaRate]").html(item.SecondAreaRate);
                            $("span[code=myThirdAreaRate]").html(item.ThirdAreaRate);
                        })

                        firstGame.ShowRun();
                        firstGame.OnBetHisClear();

                        setTimeout(firstGame.BindRunHis, 15000);
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
                url: "/ScriptServices/UsersService.asmx/BindRunHisByFirstGame",
                contentType: "application/json; charset=utf-8",
                data: '',
                success: function (data) {
                    var jsonData = (new Function("return " + data.d))();

                    var normalAppend = "";
                    var htmlAppend = "";
                    $.map(jsonData, function (item) {
                        if (item.TicketNum != "") {
                            var tickets = $.trim(item.TicketNum).split(",");
                            var normalLen = tickets.length - 1;
                            for (var i = 0; i < normalLen; i++) {
                                normalAppend += "<a class=\"ci_bl\">" + tickets[i] + "</a>";
                            }
                            normalAppend += "<a class=\"ci_rd\">" + tickets[normalLen] + "</a>";
                        }
                        
                        normalAppend = "<div class=\"fr\"><span style=\"color:#D1703E;\"><span id=\"lbHisPeriod\">" + item.Period + "</span> 期開獎結果</span> " + normalAppend + "</div>";

                        htmlAppend += "<ul class=\"h_ul\"><li class=\"td mnone\">" + item.Period + "</li>";
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
    GetTicketLevel: function (n) {
        switch (n) {
            case 1:
                return "一等奖";
            case 2:
                return "二等奖";
            case 3:
                return "三等奖";
            case 4:
                return "四等奖";
            case 5:
                return "五等奖";
            case 6:
                return "六等奖";
            case 7:
                return "七等奖";
            case 8:
                return "八等奖";
            default:
                return "";
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

        $("#lbRemainTime").text(firstGame.CreateTimeByTotalMls(totalMls));

        if (totalMls > 0) {
            setTimeout(arguments.callee, 1000);
        }
        else {
            firstGame.LoadLatestGame();
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
        firstGame.GetTotalBetDescr();
    },
    OnBetConfrm: function () {
        try {
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
                url: "/ScriptServices/UsersService.asmx/BetFirstGame",
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
                        firstGame.OnAppendToBetHis();
                        firstGame.OnBetClear();

                        jsHelper.GetUserPrice();
                    }
                    else {
                        $.messager.alert('系统提示', msg, 'info');
                    }
                }
            })
        }
        catch (err) {
            $.messager.alert('异常提示', err.message, 'info');
        }

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
    OnFirstAreaClear: function () {
        $("#firstArea").find("[type=text]").val("");
    },
    OnBetDel: function () {
        $("#t_betList>ul:not(:first)").filter(".curr").remove();
        firstGame.GetTotalBetDescr();
    },
    OnBetClear: function () {
        $("#t_betList>ul:not(:first)").remove();
        firstGame.GetTotalBetDescr();
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
        if (rows.length > 10) {
            return;
        }
        var lastRow = rows.filter(":last");
        var htmlAppend = "";
        var betRows = $("#t_betList>ul:not(:first)");
        var index = 0;
        betRows.each(function () {
            index++;
            if (index > 10) return;
            var items = $(this).children();
            htmlAppend += "<tr><td>" + items.eq(0).text() + "</td><td>" + items.eq(1).text() + "</td><td>" + items.eq(2).text() + "</td></tr>";
        })
        if (htmlAppend.length > 0) {
            lastRow.after(htmlAppend);
        }

        firstGame.SetRowStyle("betHis");
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
                $("span[code=mySecondAreaRate]").html(item.SecondAreaRate);
                $("span[code=myThirdAreaRate]").html(item.ThirdAreaRate);
            })
        }
    }
}