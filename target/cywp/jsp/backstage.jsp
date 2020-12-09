<%--
  Created by IntelliJ IDEA.
  User: Vapour
  Date: 2020/12/2
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript" src="/js/backstage.js" charset="UTF-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
<%--        <ul class="layui-nav layui-layout-left">--%>
<%--            <li class="layui-nav-item"><a href="">控制台</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">商品管理</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">用户</a></li>--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">其它系统</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">邮件管理</a></dd>--%>
<%--                    <dd><a href="">消息管理</a></dd>--%>
<%--                    <dd><a href="">授权管理</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/jsp/Users.jsp">用户查询</a></dd>
                        <dd><a href="/jsp/userManage.jsp">用户管控</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">文档管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/jsp/fileAudit.jsp">文档审核</a></dd>
                        <dd><a id="butt">文档配置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">日志管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">日志列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">上传奖励配置</a></dd>
                        <dd><a href="javascript:;">注册奖励配置</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div style="display: none;" id="gb">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">复选框</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="fileSuf1" title=".doc/.docx">
                    <input type="checkbox" name="fileSuf2" title=".xls/.xlsx">
                    <input type="checkbox" name="fileSuf" title=".ppt/.pptx">
                </div>
                <div class="layui-input-block">
                    <input type="checkbox" name="fileSuf" title=".jpg">
                    <input type="checkbox" name="fileSuf" title=".png">
                    <input type="checkbox" name="fileSuf" title=".txt">
                </div>
                <div class="layui-input-block">
                    <input type="checkbox" name="fileSuf" title=".war">
                    <input type="checkbox" name="fileSuf" title=".java">
                    <input type="checkbox" name="fileSuf" title=".class">
                </div>
                <div class="layui-input-block">
                    <input type="checkbox" name="fileSuf" title=".zip">
                    <input type="checkbox" name="fileSuf" title=".7z">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo2" style="width: 80px">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary" style="width: 80px">重置</button>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
<%--        <div style="padding: 15px;">内容主体区域</div>--%>
        <iframe id="iframeMain" src="" style="width: 100%"; height="100%";>

        </iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });

    $(function() {
        layui.use(['form','layedit', 'laydate'], function(){
            var form = layui.form
                , layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;
            $("#butt").click(function() {
                layer.open({
                    type: 1,
                    title: "文档配置",
                    area: ['500px', '400px'],
                    offset: '200px',
                    content: $("#gb"),
                    cancel: function() {
                        $(this).css("display","none")
                    },
                    success: function() {
                        form.on('submit(formDemo2)', function(data) {
                            $.ajax({
                                url:"/fileServlet?methodName=changeFileTypeState",
                                type:"post",
                                data:data.field,
                                dataType:"text",
                                success:function (data) {
                                    layer.msg(data, {
                                        time: 2000, //2s后自动关闭
                                        btn: ['确定']
                                    });
                                },
                                error:function () {
                                    alert('网络繁忙');
                                },
                            })
                            return false;
                        });
                    }
                })
                form.render();
            })
        });
    });
</script>
</body>
</html>
