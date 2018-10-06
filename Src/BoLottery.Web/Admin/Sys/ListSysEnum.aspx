<%@ Page Title="系統枚舉配置" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListSysEnum.aspx.cs" Inherits="TygaSoft.Web.Admin.Sys.ListSysEnum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

<div class="easyui-panel" title="系統枚舉配置" data-options="fit:true" style="padding:5px;"> 

<div class="mtb5">
   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="currFun.Add()">新建</a>
   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="currFun.Edit()">編輯</a>
   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="currFun.Del()">删除</a>
</div>

<ul id="treeCt" class="easyui-tree"></ul>
<div id="mmTree" class="easyui-menu" style="width:120px;">
    <div onclick="currFun.Add()" data-options="iconCls:'icon-add'">添加</div>
    <div onclick="currFun.Edit()" data-options="iconCls:'icon-edit'">編輯</div>
    <div onclick="currFun.Del()" data-options="iconCls:'icon-remove'">删除</div>
</div>

</div>

<div id="dlg" class="easyui-dialog" title="新建/編輯" data-options="iconCls:'icon-save',closed:true,modal:true,
href:'/Templates/Admin/AddSysEnum.htm',buttons: [{
	    text:'確定',iconCls:'icon-ok',
	    handler:function(){
		    currFun.Save();
	    }
    },{
	    text:'取消',iconCls:'icon-cancel',
	    handler:function(){
		    $('#dlg').dialog('close');
	    }
    }]" style="width:400px;height:230px;padding:10px">

    
</div>

<script type="text/javascript">
    $(function () {
        $("#dlg").dialog('refresh', '/Templates/Admin/AddSysEnum.htm');
        currFun.Init();
    })

    var currFun = {
        Url: "",
        Init: function () {
            currFun.Load();
        },
        Load: function () {
            var obj = $("#treeCt");

            $.ajax({
                url: "/ScriptServices/AdminService.asmx/GetJsonForSysEnum",
                type: "post",
                data: "{}",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (json) {
                    var jsonData = (new Function("", "return " + json.d))();
                    obj.tree({
                        data: jsonData,
                        animate: true
                    })
                    currFun.OnCurrExpand();
                }
            });
        },
        Add: function () {
            currFun.Url = "/ScriptServices/AdminService.asmx/SaveSysEnum";
            var t = $("#treeCt");
            var node = t.tree('getSelected');
            if (!node) {
                $.messager.alert('錯誤提示', '請選中一個節點再進行操作', 'error');
                return false;
            }

            $("#dlg").dialog('open');
            dlgFun.Add(node);
        },
        Edit: function () {
            currFun.Url = "/ScriptServices/AdminService.asmx/SaveSysEnum";
            var t = $("#treeCt");
            var node = t.tree('getSelected');
            if (!node) {
                $.messager.alert('錯誤提示', '請選中一個節點再進行操作', 'error');
                return false;
            }
            $("#dlg").dialog('open');
            dlgFun.Edit(node, t);
        },
        Del: function () {
            var t = $("#treeCt");
            var node = t.tree('getSelected');

            if (!node) {
                $.messager.alert('錯誤提示', "請選中一個節點再進行操作", 'error');
                return false;
            }

            var childNodes = t.tree('getChildren', node.target);
            if (childNodes && childNodes.length > 0) {
                $.messager.alert('錯誤提示', "請先刪除子節點再刪除此節點", 'error');
                return false;
            }

            if (node) {
                $.messager.confirm('温馨提醒', '確定要刪除嗎？', function (r) {
                    if (r) {
                        var parentNode = t.tree('getParent', node.target);
                        if (parentNode) {
                            $("#hCurrExpandNode").val(parentNode.id);
                        }
                        $.ajax({
                            type: "POST",
                            url: "/ScriptServices/AdminService.asmx/DelSysEnum",
                            contentType: "application/json; charset=utf-8",
                            data: "{id:'" + node.id + "'}",
                            success: function (data) {
                                var msg = data.d;
                                if (msg == "1") {
                                    jeasyuiFun.show("温馨提醒", "保存成功！");
                                    currFun.Load();
                                    $('#dlg').dialog('close');
                                }
                                else {
                                    $.messager.alert('系统提示', msg, 'info');
                                }
                            }
                        })
                    }
                });
            }
        },
        Save: function () {
            var isValid = $('#dlgFm').form('validate');
            if (!isValid) return false;

            var sSort = $.trim($("#txtSort").val());
            if (sSort.length == 0) sSort = 0;

            $.ajax({
                url: currFun.Url,
                type: "post",
                data: '{sysEnumModel:{Id:"' + $("#hId").val() + '",EnumName:"' + $("#txtName").val() + '",EnumCode:"' + $("#txtCode").val() + '",ParentId:"' + $("#hParentId").val() + '",Sort:' + sSort + '}}',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var msg = data.d;
                    if (msg == "1") {
                        jeasyuiFun.show("温馨提示", "保存成功！");
                        currFun.Load();
                        $('#dlg').dialog('close');
                    }
                    else {
                        $.messager.alert('系统提示', msg, 'info');
                    }
                }
            });
        },
        OnCurrExpand: function () {
            var t = $("#treeCt");
            var root = t.tree('getRoot');
            if (root) {
                var childNodes = t.tree('getChildren', root.target);
                if (childNodes && (childNodes.length > 0)) {
                    var cnLen = childNodes.length;
                    for (var i = 0; i < cnLen; i++) {
                        t.tree('collapseAll', childNodes[i].target);
                    }
                }
            }
            var currNode = t.tree('find', $("#hCurrExpandNode").val());
            if (currNode) {
                currFun.OnExpand(t, currNode);
            }
        },
        OnExpand: function (t, node) {
            if (node) {
                t.tree('expand', node.target);
                var pNode = t.tree('getParent', node.target);
                if (pNode) {
                    currFun.OnExpand(t, pNode);
                }
            }
        }
    }
</script>

</asp:Content>
