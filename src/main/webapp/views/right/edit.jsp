<%--
  Created by IntelliJ IDEA.
  User: LiuSuFen
  Date: 2018/4/26 0026
  Time: 下午 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include.jsp" %>
<html>
<head>
    <title>添加权限</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.4.5/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.4.5/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/index.css"/>
</head>
<body>
<div style="width: 100%;margin-top: 20px;">
    <div style="width:500px;margin:0 auto;">
        <div class="easyui-panel" title="修改权限" style="padding:10px;">
            <form id="rightForm" method="post">
                <input name="trId" value="${right.trId}">
                <div style="margin-bottom:20px">
                    <div>权限名称:</div>
                    <input name="rightName" value="${right.rightName}" class="easyui-textbox" data-options="required:true" style="width:100%;height:32px">
                </div>
                <div style="margin-bottom:20px">
                    <div>父级权限:</div>
                    <input name="parentTrId" class="easyui-combotree" style="width:100%;height:32px"
                           value="${right.parentTrId}"
                           data-options="url:'${ctx}/right/rightTree',required:true">
                </div>
                <div style="margin-bottom:20px">
                    <div>权限URL:</div>
                    <input name="url" value="${right.url}" class="easyui-textbox" style="width:100%;height:32px">
                </div>
                <div style="margin-bottom:20px">
                    <div>权限备注:</div>
                    <input name="description" value="${right.description}" class="easyui-textbox" style="width:100%;height:32px">
                </div>
                <div style="margin-bottom:20px">
                    <div>排序:</div>
                    <input name="showOrder" value="${right.showOrder}" class="easyui-numberbox" data-options="value:0"
                           style="width:100%;height:32px">
                </div>
                <div style="margin-bottom:20px;text-align: right;">
                    <a id="editRight" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.4.5/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/common-childtab.js"></script>
<script type="text/javascript">
    $('#editRight').click(function () {
        editRight();
    })
    function editRight() {
        $.messager.progress();	// display the progress bar
        $('#rightForm').form('submit', {
            url: '${ctx}/right/editRight',
            onSubmit: function () {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function () {
                $.messager.progress('close');	// hide progress bar while submit successfully
                tabsClose();
            }
        });
    }
</script>
</html>
