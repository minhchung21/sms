<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        成績管理
    </h2>


    <!-- 完了メッセージ -->
    <div class="alert alert-success">

        登録が完了しました。

    </div>


    <!-- ボタン -->
    <div class="mt-4 d-flex gap-3">

    <a href="TestRegist.action"
       class="btn btn-primary">
        戻る
    </a>

    <a href="TestList.action"
       class="btn btn-outline-secondary">
        成績参照
    </a>

</div>

<%@include file="../footer.jsp" %>


