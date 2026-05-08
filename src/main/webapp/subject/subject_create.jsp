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
    科目情報登録
</h2>

<form action="SubjectCreateExecute.action" method="post">

    <!-- 科目コード -->
    <div style="margin:20px 0;">
        <label>科目コード</label><br>
        <input type="text" name="cd" value="${cd}" maxlength="3"
            placeholder="科目コードを入力してください" 
            required
            style="margin-top:5px; padding:5px; width:100%; box-sizing:border-box;">

        <c:if test="${not empty errors.cd}">
            <div style="color:red; margin-top:5px;">
                ${errors.cd}
            </div>
        </c:if>
    </div>

    <!-- 科目名 -->
    <div style="margin:20px 0;">
        <label>科目名</label><br>
        <input type="text" name="name" value="${name}" maxlength="20"
               placeholder="科目名を入力してください"
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
                       padding:8px 16px; border-radius:5px;">
            登録して終了
        </button>
    </div>

</form>

<br>

<a href="SubjectList.action">戻る</a>

</section>