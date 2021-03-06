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


<div style="padding: 30px 600px 10px">
    <form   method="post" action="reader_querybook_do.html" class="form-inline"  id="searchform">
        <div class="input-group">
            <input type="text" placeholder="输入文档号、文档名或出版社" class="form-control" id="search" name="searchWord" class="form-control">
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
<div style="position: relative;top: 10%">
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
<c:if test="${!empty documents}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                查询结果：
            </h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>文档名</th>
                    <th>副本号</th>
                    <th>所在场馆</th>
                    <th>出版社</th>
                    <th>出版日期</th>
                    <th>详情</th>
                    <th>操作</th>
                    <th>预约</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${documents}" var="alog">
                    <tr>
                        <td><c:out value="${alog.title}"></c:out></td>
                        <td><c:out value="${alog.indexID}"></c:out></td>
                        <td><c:out value="${alog.branch}"></c:out></td>
                        <td><c:out value="${alog.publisher}"></c:out></td>
                        <td><c:out value="${alog.publisherDate}"></c:out></td>
                        <td><a href="readerbookdetail.html?documentId=<c:out value="${alog.documentId}"></c:out>"><button type="button" class="btn btn-success btn-xs">详情</button></a></td>
                         <c:if test="${alog.state==1}">
                         <td><a href="lendbook.html?documentId=<c:out value="${alog.documentId}"></c:out>&indexId=<c:out value="${alog.indexID}"></c:out>"><button type="button" class="btn btn-primary btn-xs">借阅</button></a></td>
                         </c:if>
                         <c:if test="${alog.state==0}">
                         <td><a href="returnbook.html?documentId=<c:out value="${alog.documentId}"></c:out>&indexId=<c:out value="${alog.indexID}"></c:out>"><button type="button" class="btn btn-primary btn-xs">归还</button></a></td>
                         </c:if>
                        <td><a href="reservebook.html?documentId=<c:out value="${alog.documentId}"></c:out>&indexId=<c:out value="${alog.indexID}"></c:out>"><button type="button" class="btn btn-primary btn-xs">预约</button></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</c:if>


</body>
</html>
