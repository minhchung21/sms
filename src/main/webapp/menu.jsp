<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp" %>

<section style="padding:20px;">

<!-- タイトル -->
<h2 style="background:#eee; padding:10px;">
    メニュー
</h2>

<nav style="background:#f8f9fa; padding:10px; margin-bottom:15px;">
    <ul style="display:flex; gap:20px; list-style:none; margin:0; padding:0;">

        <!-- 学生管理 -->
        <li>
            <a href="../student/StudentList.action">
                学生管理
            </a>
        </li>

        <!-- 成績管理 -->
        <li>
            <a href="#">
                成績管理
            </a>
        </li>

        <!-- 科目管理 -->
        <li>
            <a href="../subject/SubjectList.action">
                科目管理
            </a>
        </li>

    </ul>
</nav>
