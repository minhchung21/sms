<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>得点管理システム</title>

<!-- Bootstrap -->
<link
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
 rel="stylesheet">

<style>

/* ===== Base ===== */
body{
    margin:0;
    font-family:"Yu Gothic","Meiryo",sans-serif;
    background:#ffffff;
    color:#333;
}


/* ===== Header ===== */
.header{
    background:#dfe7f1;
    padding:15px 25px;
    border-bottom:1px solid #ccc;
    
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h1{
    margin:0;
    font-size:30px;
    font-weight:bold;
}

/* user info */
.user-info{
    margin-top:0;
    font-size:14px;
}

.user-info a{
    margin-left:10px;
}


/* ===== Layout ===== */
.container-box{
    display:flex;
}


/* ===== Sidebar ===== */
.sidebar{
    width:220px;

    padding:20px;

    background:#f3f3f3;
    border-right:1px solid #ddd;
}

/* menu title */
.sidebar-title{
    margin-bottom:15px;
    font-size:18px;
    font-weight:bold;
}

/* menu link */
.sidebar a{
    display:block;

    padding:10px 12px;
    margin-bottom:8px;

    border-radius:6px;

    color:#333;
    text-decoration:none;

    transition:0.2s;
}

.sidebar a:hover{
    background:#e3eaf5;
}

/* 成績管理 */
.menu-group{
    padding:10px 12px;
    margin-bottom:5px;

    font-weight:normal;
    color:#333;
}

/* submenu */
.submenu{
    margin-left:20px;
}

.submenu a{
    font-size:14px;
}


/* ===== Content ===== */
.content{
    flex:1;

    padding:30px;

    background:#f8f9fb;
}

/* page title */
.content h2{
    margin-top:0;

    padding:12px 15px;

    background:#eee;

    border-radius:5px;

    font-size:24px;
}


/* ===== Form ===== */
.row-box{
    display:flex;
    align-items:flex-end;
    gap:20px;

    margin:20px 0;
    padding:20px;

    background:#fafafa;

    border:1px solid #ddd;
    border-radius:6px;
}

/* input area */
.col-4,
.col-2{
    display:flex;
    flex-direction:column;
}

.col-4{
    width:260px;
}

.col-2{
    width:120px;
}

/* label */
label{
    margin-bottom:8px;
    font-size:14px;
}

/* input */
input[type="text"],
input[type="password"],
select{
    height:38px;

    padding:0 10px;

    border:1px solid #ccc;
    border-radius:4px;

    box-sizing:border-box;
}

/* checkbox */
input[type="checkbox"]{
    margin-left:5px;
}


/* ===== Button ===== */
button{
    height:38px;

    padding:0 20px;

    border:none;
    border-radius:4px;

    background:#666;
    color:white;

    cursor:pointer;
}

button:hover{
    opacity:0.9;
}


/* ===== Table ===== */
table{
    width:100%;

    background:white;

    border-collapse:collapse;
}

th{
    padding:12px 10px;

    background:#f5f5f5;

    border-bottom:2px solid #ccc;

    text-align:left;
}

td{
    padding:12px 10px;

    border-bottom:1px solid #e5e5e5;
}

tr:hover{
    background:#fafafa;
}


/* ===== Link ===== */
a{
    text-decoration:none;
}

a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<!-- ===== Header ===== -->
<div class="header">

    <h1>得点管理システム</h1>

    <c:if test="${not empty sessionScope.teacher}">

        <div class="user-info">

            ${sessionScope.teacher.name}様

            <a href="/sms/auth/Logout.action"
               class="btn btn-sm btn-outline-primary">

                ログアウト

            </a>

        </div>

    </c:if>

</div>


<!-- ===== Login 後 ===== -->
<c:if test="${not empty sessionScope.teacher}">

    <div class="container-box">

        <!-- ===== Sidebar ===== -->
        <div class="sidebar">

            <div class="sidebar-title">
                メニュー
            </div>

            <a href="../auth/Menu.action">
                メニュー
            </a>

            <a href="../student/StudentList.action">
                学生管理
            </a>

            <!-- 成績管理 -->
            <div class="menu-group">
                成績管理
            </div>

            <!-- submenu -->
            <div class="submenu">

                <a href="../test/TestRegist.action">
                    成績登録
                </a>

                <a href="../test/TestList.action">
                    成績参照
                </a>

            </div>

            <a href="../subject/SubjectList.action">
                科目管理
            </a>
            
            <a href="../classnum/ClassList.action">
               	クラス管理
            </a>

        </div>

        <!-- ===== Content ===== -->
        <div class="content">

</c:if>


<!-- ===== Login 前 ===== -->
<c:if test="${empty sessionScope.teacher}">

    <div class="content">

</c:if>