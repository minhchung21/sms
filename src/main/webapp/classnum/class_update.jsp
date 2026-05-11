<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        クラス情報変更
    </h2>


    <!-- エラー -->
    <c:if test="${not empty errors}">

        <div class="alert alert-danger">

            <c:forEach var="e" items="${errors.values()}">
                <div>${e}</div>
            </c:forEach>

        </div>

    </c:if>



    <!-- Form -->
    <form action="ClassUpdateExecute.action"
          method="post"
          style="max-width:700px;">


        <!-- クラス番号（旧値 hidden） -->
        <input type="hidden"
               name="old_class_num"
               value="${classNum.class_num}">



        <!-- クラス番号 -->
        <div class="mb-4">

            <label class="form-label">
                クラス番号
            </label>

            <input type="text"
                   name="class_num"
                   value="${classNum.class_num}"
                   maxlength="3"
                   required
                   class="form-control">

        </div>



        <!-- ボタン -->
        <div class="d-flex gap-2">

            <button type="submit"
                    class="btn btn-primary">

                変更

            </button>

            <a href="ClassList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>