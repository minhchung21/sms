<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        科目情報削除
    </h2>


    <!-- エラー -->
    <c:if test="${not empty errorMessage}">

        <div class="alert alert-danger">

            ${errorMessage}

        </div>

    </c:if>



    <!-- メッセージ -->
    <div class="alert alert-warning">

        「${subject.name}（${subject.cd}）」を削除してもよろしいですか？

    </div>



    <!-- 削除 -->
    <form action="SubjectDeleteExecute.action"
          method="post">

        <input type="hidden"
               name="cd"
               value="${subject.cd}">


        <!-- ボタン -->
        <div class="d-flex gap-2 mt-4">

            <button type="submit"
                    class="btn btn-danger">

                削除

            </button>

            <a href="SubjectList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>

<%@include file="../footer.jsp" %>

