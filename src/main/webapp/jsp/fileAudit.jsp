<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" charset="UTF-8" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="demoTable">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">上传时间</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="date" name="timeBeg" id="timeBeg" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">至</div>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="date" name="timeEnd" id="timeEnd" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">文档标题</label>
            <div class="layui-input-inline" style="width: 160px;">
                <input class="layui-input" name="fileName" id="fileName" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">文档类型</label>
                <div class="layui-input-block">
                    <select name="fileType" id="fileType" lay-filter="aihao">
                        <option value=""></option>
                        <option value=".doc">.doc/.docx</option>
                        <option value=".xls">.xls/.xlsx</option>
                        <option value=".ppt">.ppt/.pptx</option>
                        <option value=".jpg">.jpg</option>
                        <option value=".png">.png</option>
                        <option value=".txt">.txt</option>
                        <option value=".zip">.zip</option>
                        <option value=".7z">.7z</option>
                        <option value=".war">.war</option>
                        <option value=".java">.java</option>
                        <option value=".class">.class</option>
                    </select>
                </div>
            </div>
            <label class="layui-form-label">上传人</label>
            <div class="layui-input-inline" style="width: 160px;">
                <input class="layui-input" name="account" id="account" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>

    </div>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>


<script src="/layui/layui.js" charset="utf-8"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下载</a>
    {{# if(d.fileState == '未审核'){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="audit">审核</a>
    {{# } }}
    {{# if(d.fileState != '未审核'){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="open">已审核</a>
    {{# } }}
</script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/fileServlet?methodName=findAll'
            ,cols: [[
                {field:'fileId', title: 'Id', width:120}
                ,{field:'fileName', title: '文档标题', width:120}
                ,{field:'account', title: '上传人', width:120, sort: true}
                ,{field:'uploadTime', title: '上传时间', width:120}
                ,{field:'dlpoint', title: '下载积分', width:120}
                ,{field:'fileType', title: '文档类型', sort: true, width:120}
                ,{field:'fileState', title: '审核状态', sort: true, width:120}
                , {fixed: 'right', width: 178, align: 'center', title: '操作', toolbar: '#barDemo'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 310
            ,limits:[3,5,10]
            ,limit:10
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                var result;
                if (this.page.curr) {
                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                } else {
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
                var demoReload = $('#demoReload');

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
            var account = $("#account").val();
            var timeBeg = $("#timeBeg").val();
            var timeEnd = $("#timeEnd").val();
            var fileType = $("#fileType").val();
            var fileName = $("#fileName").val();
            table.reload('testReload', {
                url: '/fileServlet?methodName=findAll'
                , where: {
                    account: account,
                    timeBeg: timeBeg,
                    timeEnd: timeEnd,
                    fileType: fileType,
                    fileName: fileName
                } //设定异步数据接口的额外参数

            });
        });
    });
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听工具条
        table.on('tool(user)', function(obj){
            console.log(obj)
            var data = obj.data;
            if(obj.event === 'audit'){
                if(data.fileState=="未审核"){
                    var index = layer.confirm('请确定是否通过审核？', {
                        btn: ['审核通过','审核不通过'], //按钮
                        shade: false //不显示遮罩
                    }, function(){
                        ajax(data.fileId,"已审核")
                        layer.close(index);
                    }, function(){
                        ajax(data.fileId,"未过审")
                        layer.close(index);
                    });
                }
            }
            function ajax(fileId,fileState) {
                $.ajax({
                    url:"/fileServlet?methodName=changeFileState",
                    type:"post",
                    data:"fileId="+fileId+"&fileState="+fileState,
                    dataType:"text",
                    success:function (date) {
                        alert(date)
                        if (date=="修改成功"){
                            obj.update({
                                fileState: fileState
                            });
                            obj.tr.children().eq(7).children().eq(0).children().eq(1).html("已审核")
                        }
                    },
                    error:function () {
                        alert('网络繁忙');
                    },
                })
            }
        });
    });
</script>
</body>
</html>