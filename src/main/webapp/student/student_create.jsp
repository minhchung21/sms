<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        学生情報登録
    </h2>


    <!-- Form -->
    <form action="StudentCreateExecute.action"
          method="post"
          style="max-width:700px;">


        <!-- 入学年度 -->
        <div class="mb-3">

            <label class="form-label">
                入学年度
            </label>

            <select name="ent_year"
                    class="form-select">

                <option value="0">
                    --------
                </option>

                <option value="2024"
                    <c:if test="${ent_year == 2024}">
                        selected
                    </c:if>>
                    2024
                </option>

                <option value="2025"
                    <c:if test="${ent_year == 2025}">
                        selected
                    </c:if>>
                    2025
                </option>

                <option value="2026"
                    <c:if test="${ent_year == 2026}">
                        selected
                    </c:if>>
                    2026
                </option>

                <option value="2027"
                    <c:if test="${ent_year == 2027}">
                        selected
                    </c:if>>
                    2027
                </option>

            </select>

            <c:if test="${not empty errors.entYear}">

                <div class="text-danger mt-1">

                    ${errors.entYear}

                </div>

            </c:if>

        </div>



        <!-- 学生番号 -->
        <div class="mb-3">

            <label class="form-label">
                学生番号
            </label>

            <input type="text"
                   name="no"
                   value="${no}"
                   maxlength="10"
                   placeholder="学生番号を入力してください"
                   required
                   class="form-control">

            <c:if test="${not empty errors.no}">

                <div class="text-danger mt-1">

                    ${errors.no}

                </div>

            </c:if>

        </div>



        <!-- 氏名 -->
        <div class="mb-3">

            <label class="form-label">
                氏名
            </label>

            <input type="text"
                   name="name"
                   value="${name}"
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
        <div class="mb-4">

            <label class="form-label">
                クラス
            </label>

            <select name="class_num"
                    class="form-select">

                <c:forEach var="num" items="${classnum}">

                    <option value="${num}"
                        <c:if test="${class_num == num}">
                            selected
                        </c:if>>

                        ${num}

                    </option>

                </c:forEach>

            </select>

        </div>



        <!-- ボタン -->
        <div class="d-flex gap-2">

            <button type="submit"
                    class="btn btn-primary">

                登録して終了

            </button>

            <a href="StudentList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>
