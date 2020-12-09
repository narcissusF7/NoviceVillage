<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/1
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <script src="/js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.all.js"></script>
<%--    <script type="text/javascript" src="/layui/layui.js"></script>--%>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<form class="layui-form" action="">
    <div class="container">
        <button class="close" title="关闭">X</button>
        <div class="layui-form-mid layui-word-aux">
            <img id="logoid" src="/img/01.png" height="35">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="account" required  lay-verify="required" placeholder="请输入用户名"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
            </div>
        </div>
        <a href="" class="font-set">忘记密码?</a>  <a id="butt" class="font-set">立即注册</a>
    </div>
</form>



<%--注册页面--%>
<%--注册页面--%>
<div style="display: none;" id="gb">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户账号</label>
            <div class="layui-input-inline">
                <input type="text" name="account" id="userName" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="pwd" placeholder="请输入密码" autocomplete="off" class="layui-input" id="pass1">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="passwords" required lay-verify="pwd" placeholder="请再次输入密码" autocomplete="off" class="layui-input" id="pass2">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="email" name="email" required lay-verify="emails" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" required lay-verify="phones" placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <%--        <div class="layui-form-item">--%>
        <%--            <label class="layui-form-label">兴趣</label>--%>
        <%--            <div class="layui-input-block">--%>
        <%--                <input type="checkbox" name="like[write]" title="闪电五连鞭">--%>
        <%--                <input type="checkbox" name="like[read]" title="大意" checked>--%>
        <%--                <input type="checkbox" name="like[dai]" title="没有闪">--%>
        <%--                <input type="checkbox" name="like[dai]" title="不讲武德">--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学历</label>
                <div class="layui-input-inline">
                    <select name="education" lay-verify="required" lay-filter="type">
                        <option value=""></option>
                        <option value="1">专科</option>
                        <option value="2">本科</option>
                        <option value="3">本科以上</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">职业</label>
                <div class="layui-input-inline">
                    <select name="profession" lay-verify="required" lay-filter="type">
                        <option value=""></option>
                        <option value="1">程序猿1</option>
                        <option value="2">程序猿2</option>
                        <option value="3">程序猿3</option>
                    </select>
                </div>
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


<script>
    $(function () {
        layui.use('form', function(){
            var form = layui.form;
            form.on('submit(formDemo)', function(data){
                $.ajax({
                    url:"/userServlet?methodName=login",
                    type:"post",
                    data:data.field,
                    dataType:"text",
                    success:function (data) {
                        alert(data);
                        if (data=="登录成功"){
                            location.href="jsp/backstage.jsp";
                        }
                    },
                    error:function () {
                        alert('网络繁忙');
                    },
                })
                return false;
            });
        })
    })
</script>

<script>
    //注册按钮
    $(function() {
        layui.use(['form','layedit', 'laydate'], function(){
            var form = layui.form
                , layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;
            $("#butt").click(function() {
                layer.open({
                    type: 1,
                    title: "注册页面",
                    area: ['600px', '700px'],
                    offset: '20px',
                    content: $("#gb"),
                    cancel: function() {
                        $(this).css("display","none")
                    },
                    success: function() {
                        form.on('submit(formDemo2)', function(data) {
                            $.ajax({
                                url:"/userServlet?methodName=register",
                                type:"post",
                                data:data.field,
                                dataType:"text",
                                success:function (data) {
                                    layer.msg(data, {
                                        time: 2000, //2s后自动关闭
                                        btn: ['确定']
                                    });
                                    if (data=="注册成功"){
                                        location.href="";
                                    }
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

            //验证输入的密码是否相同；
            $("#pass2").blur(function() {
                var pass1 = $("#pass1").val();
                var pass2 = $("#pass2").val();
                if(pass1 != pass2) {
                    layer.msg("两次输入的密码不一致", {
                        "icon": 2,
                        "time": 2000
                    });
                    $("#pass2").val("");
                    return false;
                }
                return true;
            });

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
            //自定义验证规则
            form.verify({
                title: function(value) {
                    if(value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                },
                pwd: [
                    /^(\w){6,20}$/, '只能输入6-20个字母、数字、下划线'
                ],
                emails: [
                    /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/, '请输入正确的邮箱格式：<br>如：xxx@qq.com<br>xxx@163.com等格式'
                ],
                phones: [
                    /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/, '您的输入有误，请重新输入(中国11位手机号)'
                ],
                truename: [
                    /^[\u4e00-\u9fa5]{2,4}$/, '您的输入有误，请输入2-4位中文'
                ],
                cardId: [
                    /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/, '请输入正确的身份证号'
                ],
                content: function(value) {
                    layedit.sync(editIndex);
                }
            });
        });
    });
</script>
</body>
</html>
