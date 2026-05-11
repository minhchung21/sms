<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        学生情報変更
    </h2>


    <!-- エラー -->
    <c:if test="${not empty errorMessage}">

        <div class="alert alert-danger">

            ${errorMessage}

        </div>

    </c:if>



    <!-- Form -->
    <form action="StudentUpdateExecute.action"
          method="post"
          style="max-width:700px;">


        <!-- 入学年度 -->
        <div class="mb-3">

            <label class="form-label">
                入学年度
            </label>

            <input type="text"
                   value="${student.entYear}"
                   class="form-control"
                   readonly>

            <input type="hidden"
                   name="entYear"
                   value="${student.entYear}">

        </div>



        <!-- 学生番号 -->
        <div class="mb-3">

            <label class="form-label">
                学生番号
            </label>

            <input type="text"
                   value="${student.no}"
                   class="form-control"
                   readonly>

            <input type="hidden"
                   name="no"
                   value="${student.no}">

        </div>



        <!-- 氏名 -->
        <div class="mb-3">

            <label class="form-label">
                氏名
            </label>

            <input type="text"
                   name="name"
                   value="${student.name}"
                   maxlength="30"
                   placeholder="氏名を入力してください"
                   required
                   class="form-control">

            <c:if test="${not empty errors.name}">

                <div class="text-danger mt-1">

                    ${errors.name}

                </div>

            </c:if>

        </div>



        <!-- クラス -->
        <div class="mb-3">

            <label class="form-label">
                クラス
            </label>

            <select name="classNum"
                    class="form-select">

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
        <div class="mb-4 form-check">

            <input type="checkbox"
                   name="attend"
                   value="true"
                   class="form-check-input"

                   <c:if test="${student.attend}">
                       checked
                   </c:if>>

            <label class="form-check-label">

                在学中

            </label>

        </div>



        <!-- ボタン -->
        <div class="d-flex gap-2">

            <button type="submit"
                    class="btn btn-primary">

                変更

            </button>

            <a href="StudentList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>
