<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<section style="padding:20px;">

    <!-- タイトル -->
    <h2 style="
    background:#eee;
    padding:10px 15px;
    margin-bottom:20px;
">	科目情報変更
    </h2>

    <!-- エラー表示 -->
<c:if test="${not empty errorMessage}">
    <div style="color:red; margin-bottom:15px;">
        ${errorMessage}
    </div>
</c:if>

<form action="SubjectUpdateExecute.action" method="post">

    <!-- 科目コード（固定） -->
    <div style="margin-bottom:15px;">
        <label>科目コード</label><br>
        <div style="margin-top:5px;">
            ${subject.cd}
        </div>
        <input type="hidden" name="cd" value="${subject.cd}">
    </div>

    <!-- 科目名 -->
    <div style="margin-bottom:20px;">
        <label>科目名</label><br>
        <input type="text" name="name"
               value="${subject.name}"
               maxlength="20"
               required
               style="margin-top:5px; padding:5px; width:100%; box-sizing:border-box;">

        <c:if test="${not empty errors.name}">
            <div style="color:red; margin-top:5px;">
                ${errors.name}
            </div>
        </c:if>
    </div>

    <!-- ボタン -->
    <div style="margin-top:20px;">
        <button type="submit"
                style="background:#2d6cdf; color:white; border:none;
                       padding:8px 16px; border-radius:5px;">変更</button>
    </div>

</form>

<br>
<a href="SubjectList.action">戻る</a>