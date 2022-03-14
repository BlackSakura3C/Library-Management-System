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
    <form action="book_add_do.html" method="post" id="addbook">

        <div class="form-group">
            <label for="title">文档名</label>
            <input type="text" class="form-control" name="title" id="title" placeholder="请输入书名">
        </div>
        <div class="form-group">
            <label for="title">所在场馆</label>
            <input type="text" class="form-control" name="branch" id="branch" placeholder="请输入所在场馆">
        </div>
        <div class="form-group">
            <label for="publisher">出版社</label>
            <input type="text" class="form-control" name="publisher" id="publisher" placeholder="请输入出版社">
        </div>
        <div class="form-group">
            <label for="publisherDate">出版时间</label>
            <input type=date class="form-control" name="publisherDate" id="publisherDate" placeholder="请输入出版时间">
        </div>
        <div class="form-group">
            <label for="publisherAddress">出版地</label>
            <input type="text" class="form-control" name="publisherAddress" id="publisherAddress" placeholder="请输入出版地">
        </div>
        <div class="form-group">
            <label for="class">类别</label>
            <select class="tab-head" name="class" id="class" onclick="onClick()">
                <option selected="selected" value=1>书籍</option>
                <option value=2>会议</option>
                <option value=3>期刊</option>
            </select>
        </div>

        <div class="tab-content">
            <div id="book-content">
                <div class="form-group">
                    <label for="AuthorName">作者</label>
                    <input type="text" class="form-control" name="AuthorName" id="AuthorName" placeholder="请输入作者名">
                </div>
                <div class="form-group">
                    <label for="isbn">ISBN</label>
                    <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN">
                </div>
            </div>
            <div id="conference-content">
                <div class="form-group">
                    <label for="Conferencedate">会议日期</label>
                    <input type=date class="form-control" name="Conferencedate" id="Conferencedate"
                           placeholder="请输入会议日期">
                </div>
                <div class="form-group">
                    <label for="Conferencelocation">会议地点</label>
                    <input type="text" class="form-control" name="Conferencelocation" id="Conferencelocation"
                           placeholder="请输入会议地点">
                </div>
                <div class="form-group">
                    <label for="ProceedingEditor">会议编辑</label>
                    <input type="text" class="form-control" name="ProceedingEditor" id="ProceedingEditor"
                           placeholder="请输入会议编辑">
                </div>
            </div>
            <div id="journal-content">
                <div class="form-group">
                    <label for="JournalName">期刊名</label>
                    <input type="text" class="form-control" name="JournalName" id="JournalName" placeholder="请输入期刊名">
                </div>
                <div class="form-group">
                    <label for="JournalEditor">期刊编辑</label>
                    <input type="text" class="form-control" name="JournalEditor" id="JournalEditor"
                           placeholder="请输入期刊编辑">
                </div>
                <div class="form-group">
                    <label for="scope">范围</label>
                    <input type="text" class="form-control" name="scope" id="scope" placeholder="请输入范围">
                </div>
                <div class="form-group">
                    <label for="VolumeName">卷名称</label>
                    <input type="text" class="form-control" name="VolumeName" id="VolumeName" placeholder="请输入卷名称">
                </div>
                <div class="form-group">
                    <label for="VolumeEditor">卷编辑</label>
                    <input type="text" class="form-control" name="VolumeEditor" id="VolumeEditor" placeholder="请输入卷编辑">
                </div>
            </div>
        </div>
        <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
        <script>
            function mySubmit(flag) {
                return flag;
            }
        </script>
        <script>
            $('#book-content').show();
            $('#conference-content').hide();
            $('#journal-content').hide();

            function onClick() {
                var v = document.getElementById("class").value;
                if(v==='1'){
                    $('#book-content').show();
                    $('#conference-content').hide();
                    $('#journal-content').hide();
                }else if(v==='2'){
                    $('#book-content').hide();
                    $('#conference-content').show();
                    $('#journal-content').hide();
                }else if(v==='3'){
                    $('#book-content').hide();
                    $('#conference-content').hide();
                    $('#journal-content').show();
                }
            }
        </script>
    </form>

</div>

</body>
</html>
