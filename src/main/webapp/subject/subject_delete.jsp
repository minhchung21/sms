<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<section style="padding:20px;">

    <!-- タイトル -->
    <h2 style="
    background:#eee;
    padding:10px 15px;
    margin-bottom:20px;
">	科目情報削除
    </h2>

    <!-- エラー表示 -->
    <c:if test="${not empty errorMessage}">
        <div style="color:red; margin:15px 0;">
            ${errorMessage}
        </div>
    </c:if>

    <!-- ② メッセージ -->
    <p style="margin:20px 0;">
        「${subject.name}（${subject.cd}）」を削除してもよろしいですか
    </p>

    <!-- ③ 削除ボタン -->
    <form action="SubjectDeleteExecute.action" method="post">
        <input type="hidden" name="cd" value="${subject.cd}">
        
        <button type="submit"
                style="background:#d9534f; color:white; border:none;
                       padding:8px 16px; border-radius:5px;">
            削除
        </button>
    </form>

    <!-- ④ 戻る -->
    <div style="margin-top:20px;">
        <a href="SubjectList.action">戻る</a>
    </div>

</section>