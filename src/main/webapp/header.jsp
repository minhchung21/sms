<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>得点管理システム</title>

<style>

/* ===== Base ===== */
body {
    margin: 0;
    font-family: "Yu Gothic", "Meiryo", Arial, sans-serif;
    background: #f8f8f8;
    color: #333;
}


/* ===== Header ===== */
.header {
    background: #dfe7f1;
    padding: 15px 20px 10px;
}

/* title */
.header h1 {
    margin: 0;
    font-size: 28px;
    font-weight: bold;
}

/* user */
.user-info {
    text-align: right;
    font-size: 14px;
    margin-top: 5px;
}

/* logout */
.user-info a {
    margin-left: 10px;
    color: #007bff;
    text-decoration: none;
}

.user-info a:hover {
    text-decoration: underline;
}


/* ===== Layout ===== */
.container {
    display: flex;
}


/* ===== Sidebar ===== */
.sidebar {
    width: 200px;
    min-height: 100vh;

    padding: 20px;

    background: #f3f3f3;
    border-right: 1px solid #ddd;
}

/* menu */
.sidebar a {
    display: block;
    margin-bottom: 12px;

    color: #007bff;
    text-decoration: none;
    font-size: 14px;
}

.sidebar a:hover {
    text-decoration: underline;
}


/* ===== Content ===== */
.content {
    flex: 1;
    padding: 25px;
    background: #fff;
    min-height: 100vh;
}

/* title */
.content h2 {
    margin-top: 0;

    padding: 10px;

    background: #eee;
    font-size: 22px;
}


/* ===== Form ===== */
.row {
    display: flex;
    align-items: flex-end;
    gap: 20px;

    margin: 15px 0;
    padding: 20px;

    border: 1px solid #ddd;
    border-radius: 5px;

    background: #fafafa;
}

/* input area */
.col-4,
.col-2 {
    display: flex;
    flex-direction: column;
}

.col-4 {
    width: 260px;
}

.col-2 {
    width: 120px;
}

/* label */
label {
    margin-bottom: 8px;
    font-size: 14px;
}

/* select */
select {
    height: 38px;
    padding: 0 10px;

    border: 1px solid #ccc;
    border-radius: 4px;

    background: #fff;
}

/* text */
input[type="text"],
input[type="password"] {
    height: 38px;
    padding: 0 10px;

    border: 1px solid #ccc;
    border-radius: 4px;

    box-sizing: border-box;
}

/* checkbox */
input[type="checkbox"] {
    margin-left: 8px;
}

/* button */
button {
    height: 38px;
    padding: 0 20px;

    border: none;
    border-radius: 4px;

    background: #666;
    color: white;

    cursor: pointer;
}

button:hover {
    opacity: 0.9;
}


/* ===== Table ===== */
table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
}

/* header */
th {
    padding: 12px 10px;

    border-bottom: 2px solid #ccc;

    text-align: left;
    font-size: 14px;
}

/* body */
td {
    padding: 12px 10px;

    border-bottom: 1px solid #e5e5e5;
    font-size: 14px;
}

/* hover */
tr:hover {
    background: #fafafa;
}

/* center */
th:nth-child(4),
td:nth-child(4),
th:nth-child(5),
td:nth-child(5),
th:nth-child(6),
td:nth-child(6) {
    text-align: center;
}


/* ===== Link ===== */
a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
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

            <a href="/sms/auth/Logout.action">
                ログアウト
            </a>

        </div>

    </c:if>

</div>


<!-- login 後 -->
<c:if test="${not empty sessionScope.teacher}">

    <div class="container">

        <!-- ===== Sidebar ===== -->
        <div class="sidebar">

            <a href="../auth/Menu.action">
                メニュー
            </a>

            <a href="../student/StudentList.action">
                学生管理
            </a>

            <a href="#">
                成績管理
            </a>

            <a href="#">
                成績登録
            </a>

            <a href="#">
                成績参照
            </a>

            <a href="../subject/SubjectList.action">
                科目管理
            </a>

        </div>

        <!-- ===== Content ===== -->
        <div class="content">

</c:if>


<!-- login 前 -->
<c:if test="${empty sessionScope.teacher}">

    <div class="content">

</c:if>