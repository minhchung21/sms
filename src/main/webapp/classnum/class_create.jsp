<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        クラス情報登録
    </h2>


    <!-- form -->
    <form action="ClassCreateExecute.action" method="post">

        <!-- クラス番号 -->
        <div class="mb-3">

            <label class="form-label">
                クラス番号
            </label>

            <input type="text"
                   name="class_num"
                   value="${class_num}"
                   maxlength="3"
                   class="form-control"
                   placeholder="クラス番号を入力してください"
                   required>

            <c:if test="${not empty errors.class_num}">
                <div class="text-danger mt-1">
                    ${errors.class_num}
                </div>
            </c:if>

        </div>


        <!-- ボタン -->
        <div class="mt-4">

            <button type="submit"
                    class="btn btn-primary">

                登録して終了

            </button>

        </div>

    </form>


    <!-- 戻る -->
    <div class="mt-4">

        <a href="ClassList.action"
           class="btn btn-outline-secondary">

            戻る

        </a>

    </div>

</div>

<%@include file="../footer.jsp" %>
