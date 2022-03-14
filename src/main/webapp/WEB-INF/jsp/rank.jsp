<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>排行榜</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>

</head>
<body>
<nav  style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="admin_main.html">实验室资料管理系统</a>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        图书管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="allbooks.html">全部图书</a></li>
                        <li class="divider"></li>
                        <li><a href="admin_papers.html">全部论文</a></li>
                        <li class="divider"></li>
                        <li><a href="book_add.html">增加资源</a></li>
                        <li class="divider"></li>
                        <li><a href="paper_add.html">上传论文</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        读者管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="allreaders.html">全部读者</a></li>
                        <li class="divider"></li>
                        <li><a href="reader_add.html">增加读者</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        借还管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="lendlist.html">借还日志</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        高级搜索
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/alllibrarys.html">实验室书架信息</a></li>
                        <li class="divider"></li>
                        <li><a href="/rank.html">书籍排行榜</a></li>
                    </ul>
                </li>
                <li >
                    <a href="admin_repasswd.html" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.adminId}，已登录</a></li>
                <li><a href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            信息学部图书馆读者排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>姓名</th>
                <th>借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers1}" var="reader">
                <tr>
                    <td><c:out value="${reader.name}"></c:out></td>
                    <td><c:out value="${reader.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            工学部图书馆读者排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>姓名</th>
                <th>借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers2}" var="reader">
                <tr>
                    <td><c:out value="${reader.name}"></c:out></td>
                    <td><c:out value="${reader.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            总图书馆读者排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>姓名</th>
                <th>借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers3}" var="reader">
                <tr>
                    <td><c:out value="${reader.name}"></c:out></td>
                    <td><c:out value="${reader.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            信息学部图书馆借阅文档排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>文档名</th>
                <th>被借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${documents1}" var="document">
                <tr>
                    <td><c:out value="${document.title}"></c:out></td>
                    <td><c:out value="${document.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            工学部图书馆借阅文档排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>文档名</th>
                <th>被借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${documents2}" var="document">
                <tr>
                    <td><c:out value="${document.title}"></c:out></td>
                    <td><c:out value="${document.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            总图书馆借阅文档排行榜
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>文档名</th>
                <th>被借阅次数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${documents3}" var="document">
                <tr>
                    <td><c:out value="${document.title}"></c:out></td>
                    <td><c:out value="${document.count}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>