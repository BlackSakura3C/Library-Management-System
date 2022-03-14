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
    <title>图书信息添加</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: rgb(240, 242, 245);
        }
    </style>

</head>
<body>
<nav style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="admin_main.html">实验室图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
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
                <li>
                    <a href="admin_repasswd.html">
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.adminId}，已登录</a>
                </li>
                <li><a href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div style="position: relative;top: 10%;width: 80%;margin-left: 10%">
    <form action="paper_add_do.html" method="post" id="addpaper">

        <div class="form-group">
            <label for="paperTitle">论文名</label>
            <input type="text" class="form-control" name="paperTitle" id="paperTitle" placeholder="请输入论文名称">
        </div>
        <div class="form-group">
            <label for="paperAuthor">作者</label>
            <input type="text" class="form-control" name="paperAuthor" id="paperAuthor" placeholder="请输入论文作者">
        </div>
        <div class="form-group">
            <label for="paperDate">发表日期</label>
            <input type=date class="form-control" name="paperDate" id="paperDate" placeholder="请输入论文发表日期">
        </div>
        <div class="form-group">
            <label for="paperConferenceOrJournalname">会议/期刊名</label>
            <input type="text" class="form-control" name="paperConferenceOrJournalname" id="paperConferenceOrJournalname" placeholder="请输入会议/期刊名">
        </div>
        <div class="form-group">
            <label for="paperIssue">期号</label>
            <input type="text" class="form-control" name="paperIssue" id="paperIssue" placeholder="请输入期号">
        </div>
        <div class="form-group">
            <label for="paperVolume">卷号</label>
            <input type="text" class="form-control" name="paperVolume" id="paperVolume" placeholder="请输入卷号">
        </div>
        <div class="form-group">
            <label for="paperPage">页号</label>
            <input type="text" class="form-control" name="paperPage" id="paperPage" placeholder="请输入页号">
        </div>
        <div class="form-group">
            <label for="paperDoi">DOI</label>
            <input type="text" class="form-control" name="paperDoi" id="paperDoi" placeholder="请输入DOI">
        </div>
        <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
        <script>
            function mySubmit(flag) {
                return flag;
            }
        </script>
    </form>

</div>

</body>
</html>
