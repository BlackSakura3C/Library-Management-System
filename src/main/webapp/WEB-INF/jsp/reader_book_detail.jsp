<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.name}》</title>
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
<nav class="navbar navbar-default" role="navigation" style="background-color:#fff">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="reader_main.html"><p class="text-primary">我的主页</p></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="active">
                    <a href="reader_querybook.html" >
                        图书查询
                    </a>
                </li>
                <li>
                    <a href="reader_info.html" >
                        个人信息
                    </a>
                </li>
                <li >
                    <a href="mylend.html" >
                        我的借还
                    </a>
                </li>
                <li >
                    <a href="reader_repasswd.html" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="reader_info.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${reader.name}，已登录</a></li>
                <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${document.title}》</h3>
        </div>
        <c:if test="${!empty book.authorName}">
            <div class="panel-body">
                <table class="table table-hover">
                    <tr>
                        <th width="15%">书名</th>
                        <td>${document.title}</td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td>${document.publisher}</td>
                    </tr>
                    <tbody>
                    <tr>
                        <th>作者</th>
                        <td>${book.authorName}</td>
                    </tr>
                    <tr>
                        <th>ISBN</th>
                        <td>${book.isbn}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${!empty journalvolume.journalName}">
            <div class="panel-body">
                <table class="table table-hover">
                    <tr>
                        <th width="15%">书名</th>
                        <td>${document.title}</td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td>${document.publisher}</td>
                    </tr>
                    <tbody>
                    <tr>
                        <th>杂志编辑</th>
                        <td>${journalvolume.journalEditor}</td>
                    </tr>
                    <tr>
                        <th>杂志名称</th>
                        <td>${journalvolume.journalName}</td>
                    </tr>
                    <tr>
                        <th>范围</th>
                        <td>${journalvolume.scope}</td>
                    </tr>
                    <tr>
                        <th>卷</th>
                        <td>${journalvolume.volumeName}</td>
                    </tr>
                    <tr>
                        <th>卷编辑</th>
                        <td>${journalvolume.volumeEditor}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${!empty conference.conferencedate}">
            <div class="panel-body">
                <table class="table table-hover">
                    <tr>
                        <th width="15%">书名</th>
                        <td>${document.title}</td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td>${document.publisher}</td>
                    </tr>
                    <tbody>
                    <tr>
                        <th>会议日期</th>
                        <td>${conference.conferencedate}</td>
                    </tr>
                    <tr>
                        <th>会议地点</th>
                        <td>${conference.conferencelocation}</td>
                    </tr>
                    <tr>
                        <th>会议编辑</th>
                        <td>${conference.proceedingEditor}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

</div>

</body>
</html>
