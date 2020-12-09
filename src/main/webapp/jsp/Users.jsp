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
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="date" name="regTimebeg" id="regTimebeg" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">至</div>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="date" name="regTimeend" id="regTimeend" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline" style="width: 160px;">
                <input class="layui-input" name="account" id="account" autocomplete="off">
            </div>
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/userServlet?methodName=findUsers'
            ,cols: [[
                {field:'account', title: '用户名', width:120, sort: true, fixed: true}
                ,{field:'regTime', title: '注册时间', width:120 ,sort: true}
                ,{field:'points', title: '积分', width:120, sort: true}
                ,{field:'uploads', title: '上传数', width:120 ,sort: true}
                ,{field:'downloads', title: '下载数', width:120 , sort: true}
                ,{field:'userState', title: '用户状态', sort: true, width:120}
            ]]
            ,id: 'testReload'
            ,page: true
            , limits: [3, 5, 10]  //一页选择显示3,5或10条数据
            , limit: 10  //一页显示10条数据
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                var result;
                if (this.page.curr) {
                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                }
                else {
                    result = res.data.slice(0, this.limit);
                }
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": result //解析数据列表
                };
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#testReload');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        key: {
                            id: demoReload.val()
                        }
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var regTimebeg = $("#regTimebeg").val();
            var regTimeend = $("#regTimeend").val();
            var account = $("#account").val();
            table.reload('testReload', {
                url: '/userServlet?methodName=findUsers'
                , where: {
                    account: account,
                    regTimebeg: regTimebeg,
                    regTimeend: regTimeend
                } //设定异步数据接口的额外参数

            });
        });
    });
</script>

</body>
</html>