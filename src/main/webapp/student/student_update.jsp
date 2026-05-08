<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<section style="padding:20px;">

<!-- タイトル -->
<h2 style="
    background:#eee;
    padding:10px 15px;
    margin-bottom:20px;
">
    学生情報変更
</h2>

<!-- 存在しないエラー -->
<c:if test="${not empty errorMessage}">
    <div style="
        color:red;
        margin-bottom:15px;
    ">
        ${errorMessage}
    </div>
</c:if>

<form action="StudentUpdateExecute.action"
      method="post"
      style="max-width:920px;">

    <!-- 入学年度 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            入学年度
        </label>

        <div style="
            height:34px;
            line-height:34px;
            padding:0 10px;
            border:1px solid #ccc;
            border-radius:4px;
            background:#f8f8f8;
        ">
            ${student.entYear}
        </div>

        <input type="hidden"
               name="entYear"
               value="${student.entYear}">

    </div>


    <!-- 学生番号 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            学生番号
        </label>

        <div style="
            height:34px;
            line-height:34px;
            padding:0 10px;
            border:1px solid #ccc;
            border-radius:4px;
            background:#f8f8f8;
        ">
            ${student.no}
        </div>

        <input type="hidden"
               name="no"
               value="${student.no}">

    </div>


    <!-- 氏名 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            氏名
        </label>

        <input type="text"
               name="name"
               value="${student.name}"
               maxlength="30"
               placeholder="氏名を入力してください"
               required

               style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
               ">

        <c:if test="${not empty errors.name}">
            <div style="
                color:red;
                margin-top:4px;
            ">
                ${errors.name}
            </div>
        </c:if>

    </div>


    <!-- クラス -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            クラス
        </label>

        <select name="classNum"
                style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
                    background:#fff;
                ">

            <c:forEach var="num" items="${classList}">

                <option value="${num}"
                    <c:if test="${student.classNum == num}">
                        selected
                    </c:if>>

                    ${num}

                </option>

            </c:forEach>

        </select>

    </div>


    <!-- 在学中 -->
    <div style="margin-bottom:18px;">

        <label>

            <input type="checkbox"
                   name="attend"
                   value="true"

                   <c:if test="${student.attend}">
                       checked
                   </c:if>>

            在学中

        </label>

    </div>


    <!-- ボタン -->
    <div style="margin-top:8px;">

        <button type="submit"
                style="
                    height:36px;
                    padding:0 18px;
                    border:none;
                    border-radius:4px;
                    background:#666;
                    color:#fff;
                    cursor:pointer;
                ">
            変更
        </button>

    </div>

</form>


<div style="margin-top:14px;">

    <a href="StudentList.action">
        戻る
    </a>

</div>

</section>