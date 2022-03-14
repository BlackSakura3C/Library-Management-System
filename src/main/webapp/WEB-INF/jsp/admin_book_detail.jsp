<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kkc
  Date: 2022/2/22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${document.title}》</title>
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
                            <th>副本号</th>
                            <td>${document.indexID}</td>
                        </tr>
                        <tr>
                            <th>所在场馆</th>
                            <td>${document.branch}</td>
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
