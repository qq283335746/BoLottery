
var MenusFun = {
    Init: function () {
        MenusFun.SelectCurrent();
        MenusFun.Hover();
    },
    Hover: function () {
        $(".nav a").hover(function () {
            $(this).addClass("hover").siblings().removeClass("hover");
        }, function () {
            $(this).removeClass("hover")
        })
    },
    SelectCurrent: function () {
        var currMenu = $("#SitePaths>span:last").text();
        $(".nav a").filter(":contains('" + currMenu + "')").addClass("curr").siblings().removeClass("curr");
    }
};

var UserMenus = {
    Init: function () {
        UserMenus.IsManager = UserMenus.GetIsManager();
        UserMenus.TreeLoad();
    },
    TreeLoad: function () {
        var t = $("#westTree");
        $.ajax({
            url: "/ScriptServices/UsersService.asmx/GetTreeJsonForMenu",
            type: "post",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            success: function (json) {
                var jsonData = (new Function("", "return " + json.d))();
                t.tree({
                    data: jsonData,
                    formatter: function (node) {
                        if (node.id.length > 0) {
                            return "<a href=\"" + node.id + "\">" + node.text + "</a>";
                        }
                        return node.text;
                    },
                    animate: true
                })
                UserMenus.SelectCurrent();
                t.children().children("div:first").hide();

                UserMenus.BindOtherUrl();
                UserMenus.ShowOrHide();
            }
        });
    },
    SelectCurrent: function () {
        var currMenu = $("#SitePaths>span:last").text();
        $("#westTree").find("a").each(function () {
            if ($(this).text() == currMenu) {
                $(this).parent().parent().addClass("bg_curr");
            }
        })
    },
    BindOtherUrl: function () {
        var myData = $("#myDataForOtherUrl").html();
        if (myData != undefined && myData.length > 0) {
            var json = eval("(" + myData + ")");
            var lastNav = $("#westTree").find("[class*=tree-node]:last").find("a");
            $.map(json, function (item) {
                lastNav.attr("href", item.Url);
                lastNav.text(item.NavText);

            })
        }
    },
    IsManager: false,
    GetIsManager: function () {
        var isManager = false;
        var myData = $("#myDataForUserInfo").html();
        if (myData != undefined && myData.length > 0) {
            var json = eval("(" + myData + ")");
            $.map(json, function (item) {
                if (item.IsManager == "1") {
                    isManager = true;
                }
            })
        }
        return isManager;
    },
    ShowOrHide: function () {
        if (!UserMenus.IsManager) {
            $("#westTree").find("a").each(function () {
                if ($(this).attr("href") == "/u/at") {
                    $(this).parent().parent().parent().hide();
                }
            })
        }
        else {
            $("#showScoreRow").show();
        }
    }
};

var AdminMenus = {
    Init: function () {
        //AdminMenus.InitAccordion();
        //AdminMenus.InitLayout();
        AdminMenus.TreeLoad();
        //AdminMenus.InitTabs();
    },
    TreeLoad: function () {
        var t = $("#eastTree");
        $.ajax({
            url: "/ScriptServices/AdminService.asmx/GetTreeJsonForMenu",
            type: "post",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            success: function (json) {
                var jsonData = (new Function("", "return " + json.d))();
                t.tree({
                    data: jsonData,
                    formatter: function (node) {
                        if (node.id.length > 0) {
                            return "<a href=\"" + node.id + "\">" + node.text + "</a>";
                        }
                        return node.text;
                    },
                    animate: true
                })
                //AdminMenus.OnCurrExpand();
            }
        });
    }
    //    OnCurrExpand: function () {
    //        var currText = "";
    //        var t = $("#treeCt");
    //        var root = t.tree('getRoot');
    //        if (root) {
    //            var childNodes = t.tree('getChildren', root.target);

    //            if (childNodes) {
    //                var cnLen = childNodes.length;
    //                for (var i = 0; i < cnLen; i++) {
    //                    t.tree('collapseAll', childNodes[i].target);
    //                }
    //            }
    //        }
    //        var currNode = t.tree('find', currText);
    //        if (currNode) {
    //            AdminMenus.OnExpand(t, currNode);
    //        }
    //    },
    //    OnExpand: function (t, node) {
    //        if (node) {
    //            t.tree('expand', node.target);
    //            var pNode = t.tree('getParent', node.target);
    //            if (pNode) {
    //                AdminMenus.OnExpand(t, pNode);
    //            }
    //        }
    //    },

    //    //左侧（或右侧）
    //    InitAccordion: function () {
    //        $.ajax({
    //            url: "/ScriptServices/AdminService.asmx/GetMenus",
    //            type: "post",
    //            data: "{path:'" + $("#SitePaths").text() + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (html) {
    //                $("#menuNav").html(html.d);
    //                $("#menuNav").accordion({
    //                    fit: true,
    //                    border: false
    //                });
    //            }
    //        });
    //    },

    //    InitTabs: function () {
    //        $.ajax({
    //            url: "/ScriptServices/AdminService.asmx/GetTabs",
    //            type: "post",
    //            data: "{}",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (json) {
    //                $.map(json.d, function (item) {
    //                    $('#tt').tabs('add', {
    //                        title: item.Title + "<input type=\"hidden\" value=\"" + item.Url + "\" />",
    //                        closable: item.Title != "我的桌面",
    //                        selected: item.Selected
    //                    });
    //                })

    //                var tt = $("#tt");
    //                var tabsInner = tt.find("[class=tabs-inner]");
    //                tabsInner.click(function () {
    //                    var hTabsV = $(this).find("[type=hidden]").val();
    //                    if (hTabsV.length > 0) {
    //                        window.location = hTabsV;
    //                    }
    //                })
    //                var tabsClose = tt.find("[class=tabs-close]");
    //                tabsClose.click(function () {
    //                    var hTabsV = $(this).prev().find("[type=hidden]").val();
    //                    AdminMenus.OnTabsClose(hTabsV);
    //                })
    //            }
    //        });
    //    },

    //    OnTabsClose: function (h) {
    //        $.ajax({
    //            url: "/ScriptServices/AdminService.asmx/TabsClose",
    //            type: "post",
    //            data: "{url:'" + h + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (s) {
    //                window.location = s.d;
    //            }
    //        });
    //    },

    //    //缩小或展开 读取
    //    InitLayout: function () {
    //        $('#body').layout('panel', 'east').panel({
    //            onCollapse: function () {
    //                AdminMenus.OnLayout("1", "east");
    //            },
    //            onExpand: function () {
    //                AdminMenus.OnLayout("0", "east");
    //            }
    //        });
    //        $.ajax({
    //            url: "/ScriptServices/AdminService.asmx/GetLayoutByName",
    //            type: "post",
    //            data: "{name:'east'}",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (html) {
    //                if (html.d == 1) {
    //                    $('#body').layout('collapse', 'east');
    //                }
    //            }
    //        });
    //    },

    //    //缩小或展开 写入
    //    OnLayout: function (h, name) {
    //        $.ajax({
    //            url: "/ScriptServices/AdminService.asmx/OnLayout",
    //            type: "post",
    //            data: "{state:" + h + ",name:'" + name + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            success: function () {

    //            }
    //        });
    //    }
};