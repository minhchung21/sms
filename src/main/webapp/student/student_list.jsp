<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        学生管理
    </h2>

    <!-- 新規登録 -->
    <div class="text-end mb-3">

        <a href="StudentCreate.action"
           class="btn btn-primary">

            新規登録

        </a>

    </div>


    <!-- ===== 検索フォーム ===== -->
    <form method="get">

        <div class="row-box shadow-sm">

            <!-- 入学年度 -->
            <div class="col-4">

                <label>
                    入学年度
                </label>

                <select name="f1">

                    <option value="0">
                        --------
                    </option>

                    <c:forEach var="year" items="${ent_year_set}">

                        <option value="${year}"
                            <c:if test="${year == f1 + 0}">selected</c:if>>

                            ${year}

                        </option>

                    </c:forEach>

                </select>

            </div>


            <!-- クラス -->
            <div class="col-4">

                <label>
                    クラス
                </label>

                <select name="f2">

                    <option value="0">
                        --------
                    </option>

                    <c:forEach var="num" items="${class_num_set}">

                        <option value="${num}"
                            <c:if test="${num == f2}">selected</c:if>>

                            ${num}

                        </option>

                    </c:forEach>

                </select>

            </div>


            <!-- 在学中 -->
            <div class="col-2">

                <label>

                    在学中

                    <input type="checkbox"
                           name="f3"

                           <c:if test="${not empty f3}">
                               checked
                           </c:if>>

                </label>

            </div>


            <!-- ボタン -->
            <div class="col-2 d-flex align-items-end">

                <button class="btn btn-secondary">

                    絞込み

                </button>

            </div>

        </div>


        <!-- エラー -->
        <c:if test="${not empty errors.f1}">

            <div class="text-danger mt-2">

                ${errors.f1}

            </div>

        </c:if>

    </form>



    <!-- ===== 検索結果 ===== -->

    <c:if test="${not empty students}">

        <!-- 件数 -->
        <div class="mb-3">

            検索結果：
            ${students.size()}件

        </div>


        <!-- Table -->
        <table class="table table-hover table-bordered bg-white">

            <thead class="table-light">

                <tr>

                    <th>
                        入学年度
                    </th>

                    <th>
                        学生番号
                    </th>

                    <th>
                        氏名
                    </th>

                    <th class="text-center">
                        クラス
                    </th>

                    <th class="text-center">
                        在学中
                    </th>

                    <th class="text-center">
                    </th>

                </tr>

            </thead>


            <tbody>

                <!-- 学生一覧 -->
                <c:forEach var="stu" items="${students}">

                    <tr>

                        <td>
                            ${stu.entYear}
                        </td>

                        <td>
                            ${stu.no}
                        </td>

                        <td>
                            ${stu.name}
                        </td>

                        <td class="text-center">
                            ${stu.classNum}
                        </td>

                        <!-- 在学 -->
                        <td class="text-center">

                            <c:if test="${stu.attend}">
                                ○
                            </c:if>

                            <c:if test="${not stu.attend}">
                                ×
                            </c:if>

                        </td>

                        <!-- 更新 -->
                        <td class="text-center">

                            <a href="StudentUpdate.action?no=${stu.no}"
                               class="btn btn-sm btn-outline-primary">

                                変更

                            </a>

                        </td>

                    </tr>

                </c:forEach>

            </tbody>

        </table>

    </c:if>



    <!-- データなし -->
    <c:if test="${empty students}">

        <div class="alert alert-warning">

            学生情報が存在しませんでした。

        </div>

    </c:if>



    <!-- 戻る -->
    <div class="mt-4">

        <a href="../auth/Menu.action"
           class="btn btn-outline-secondary">

            メニューへ戻る

        </a>

    </div>

</div>

<%@include file="../footer.jsp" %>