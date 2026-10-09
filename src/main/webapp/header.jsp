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


/* ===== User ===== */
.user-info{
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
    width:240px;
    min-height:100vh;

    padding:20px;

    background:#f3f3f3;
    border-right:1px solid #ddd;
}


/* title */
.sidebar-title{
    margin-bottom:18px;

    font-size:18px;
    font-weight:bold;
}


/* normal menu */
.sidebar a{
    display:block;

    padding:10px 12px;
    margin-bottom:6px;

    border-radius:6px;

    color:#333;
    text-decoration:none;

    transition:0.2s;
}

.sidebar a:hover{
    background:#e5e5e5;
    text-decoration:underline;
    text-underline-offset:4px;
}


/* ===== accordion ===== */
.menu-accordion{
    background:#f3f3f3 !important;
    color:#333 !important;

    border:none !important;
    box-shadow:none !important;

    padding:10px 12px;

    font-size:15px;
    font-weight:500;

    border-radius:6px !important;
}


/* hover */
.menu-accordion:hover{
    background:#e5e5e5 !important;
}


/* opened */
.accordion-button:not(.collapsed){
    background:#e5e5e5 !important;
    color:#333 !important;
}


/* ▼ icon */
.accordion-button::after{
    transform:scale(0.6);
}


/* remove extra line */
.accordion-item{
    border:none !important;
    background:transparent !important;
}


/* submenu */
.submenu-box{
    padding-top:5px;
    padding-bottom:5px;
    padding-left:18px;
}

.submenu-box a{
    font-size:14px;
    margin-bottom:4px;
}


/* ===== Content ===== */
.content{
    flex:1;

    padding:30px;

    background:#f8f9fb;
}


/* title */
.content h2{
    margin-top:0;

    padding:12px 15px;

    background:#eee;

    border-radius:5px;

    font-size:24px;
}


/* ===== Form ===== */
label{
    margin-bottom:8px;
    font-size:14px;
}


/* ===== Table ===== */
table{
    width:100%;
    background:white;
}

th{
    padding:12px 10px;

    background:#f5f5f5;

    border-bottom:2px solid #ccc;
}

td{
    padding:12px 10px;
}


/* ===== Link ===== */
a{
    text-decoration:none;
}

a:hover{
    text-decoration:none;
}

</style>

</head>

<body>

<!-- ===== Header ===== -->
<div class="header">

    <h1>
        得点管理システム
    </h1>

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

        <!-- menu -->
        <a href="../auth/Menu.action">
            メニュー
        </a>

        <a href="../student/StudentList.action">
            学生管理
        </a>

        <a href="../subject/SubjectList.action">
            科目管理
        </a>

        <a href="../classnum/ClassList.action">
            クラス管理
        </a>



        <!-- ===== 成績管理 ===== -->
        <div class="accordion mb-2" id="scoreMenu">

            <div class="accordion-item">

                <h2 class="accordion-header">

                    <button class="accordion-button collapsed menu-accordion"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#scoreSub">

                        成績管理

                    </button>

                </h2>

                <div id="scoreSub"
                     class="accordion-collapse collapse">

                    <div class="accordion-body submenu-box">

                        <a href="../test/TestRegist.action">
                            成績登録
                        </a>

                        <a href="../test/TestList.action">
                            成績参照
                        </a>

                    </div>

                </div>

            </div>

        </div>



        <!-- ===== 出席管理 ===== -->
        <div class="accordion" id="attendanceMenu">

            <div class="accordion-item">

                <h2 class="accordion-header">

                    <button class="accordion-button collapsed menu-accordion"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#attendanceSub">

                        出席管理

                    </button>

                </h2>

                <div id="attendanceSub"
                     class="accordion-collapse collapse">

                    <div class="accordion-body submenu-box">

                        <a href="../attendance/AttendanceList.action">
                            出席登録
                        </a>

                        <a href="../attendance/AttendanceHistory.action">
                            出席参照
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>



    <!-- ===== Content ===== -->
    <div class="content">

</c:if>



<!-- ===== Login 前 ===== -->
<c:if test="${empty sessionScope.teacher}">

<div class="content">

</c:if>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
