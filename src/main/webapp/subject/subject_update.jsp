<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        科目情報変更
    </h2>


    <!-- エラー -->
    <c:if test="${not empty errorMessage}">

        <div class="alert alert-danger">

            ${errorMessage}

        </div>

    </c:if>



    <!-- Form -->
    <form action="SubjectUpdateExecute.action"
          method="post"
          style="max-width:700px;">


        <!-- 科目コード -->
        <div class="mb-3">

            <label class="form-label">
                科目コード
            </label>

            <input type="text"
                   value="${subject.cd}"
                   class="form-control"
                   readonly>

            <input type="hidden"
                   name="cd"
                   value="${subject.cd}">

        </div>



        <!-- 科目名 -->
        <div class="mb-4">

            <label class="form-label">
                科目名
            </label>

            <input type="text"
                   name="name"
                   value="${subject.name}"
                   maxlength="20"
                   required
                   class="form-control">


            <c:if test="${not empty errors.name}">

                <div class="text-danger mt-1">

                    ${errors.name}

                </div>

            </c:if>

        </div>



        <!-- ボタン -->
        <div class="d-flex gap-2">

            <button type="submit"
                    class="btn btn-primary">

                変更

            </button>

            <a href="SubjectList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>

<%@include file="../footer.jsp" %>
