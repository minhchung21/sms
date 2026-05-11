<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        学生情報登録
    </h2>


    <!-- 完了メッセージ -->
    <div class="alert alert-success">

        登録が完了しました。

    </div>


    <!-- ボタン -->
    <div class="d-flex gap-2 mt-4">

        <a href="StudentCreate.action"
           class="btn btn-primary">

            新規登録へ戻る

        </a>

        <a href="StudentList.action"
           class="btn btn-outline-secondary">

            学生一覧へ

        </a>

    </div>

</div>
