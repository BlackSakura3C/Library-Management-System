<%@ page import="com.book.domain.Book" %><%--
  Created by IntelliJ IDEA.
  User: kkc
  Date: 2022/2/22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部图书信息</title>
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
            <a class="navbar-brand" href="visitor.html">实验室资料管理系统-游览模式</a>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        资料查看
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="visitor.html">图书查看</a></li>
                        <li class="divider"></li>
                        <li><a href="visitor_papers.html">论文查看</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="visitor.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${"临时游客"}，已登录</a></li>
                <li><a href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>


<div style="padding: 80px 600px 10px">
    <form   method="post" action="visitor_paper_find.html" class="form-inline"  id="searchform">
        <div class="input-group">
           <input type="text" placeholder="输入论文/期刊名" class="form-control" id="search" name="searchWord" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        function mySubmit(flag){
            return flag;
        }
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''){
                alert("请输入关键字");
                return mySubmit(false);
            }
        })
    </script>
</div>
<div style="position: relative">
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${error}
    </div>
</c:if>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部论文/期刊
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>标题</th>
                <th>作者</th>
                <th>日期</th>
                <th>期刊/会议名称</th>
                <th>期号</th>
                <th>卷号</th>
                <th>页码</th>
                <th>DOI</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${papers}" var="alog">
            <tr>
                <td><c:out value="${alog.paperId}"></c:out></td>
                <td><c:out value="${alog.paperTitle}"></c:out></td>
                <td><c:out value="${alog.paperAuthor}"></c:out></td>
                <td><c:out value="${alog.paperDate}"></c:out></td>
                <td><c:out value="${alog.paperConferenceOrJournalName}"></c:out></td>
                <td><c:out value="${alog.paperIssue}"></c:out></td>
                <td><c:out value="${alog.paperVolume}"></c:out></td>
                <td><c:out value="${alog.paperPage}"></c:out></td>
                <td><a href="https://doi.org/${alog.paperDOI}"><c:out value="${alog.paperDOI}"></c:out></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
