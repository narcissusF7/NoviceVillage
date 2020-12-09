<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" charset="UTF-8" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="demoTable">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">操作时间</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="jouTimebeg"  autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">至</div>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="jouTimeend" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">操作人</label>
            <div class="layui-input-inline" style="width: 160px;">
                <input class="layui-input" name="uploader" id="uploader" autocomplete="off">
            </div>
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</div>


<table class="layui-table" lay-data="{width: 892, height:330, url:'/demo/table/user/', page:true, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{field:'jouTime', width:80}">操作时间</th>
        <th lay-data="{field:'jouName', width:80, sort: true}">操作人</th>
        <th lay-data="{field:'action', width:80}">操作事项</th>
    </tr>
    </thead>
</table>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
</body>
</html>