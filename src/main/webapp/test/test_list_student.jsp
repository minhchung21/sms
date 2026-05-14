<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        成績一覧（学生）
    </h2>


    <!-- ===== 検索BOX ===== -->
    <div class="card shadow-sm mb-4">

        <div class="card-body">

            <!-- ===== 科目検索 ===== -->
            <form action="TestListSubjectExecute.action"
                  method="get">

                <div class="row align-items-end g-3">

                    <!-- ラベル -->
                    <div class="col-md-2">

                        <label class="form-label fw-bold">

                            科目情報

                        </label>

                    </div>


                    <!-- 入学年度 -->
                    <div class="col-md-2">

                        <label class="form-label">

                            入学年度

                        </label>

                        <select class="form-select"
                                name="f1">

                            <option value="0">

                                --------

                            </option>

                            <c:forEach var="year"
                                       items="${entYearSet}">

                                <option value="${year}"
                                    <c:if test="${year == f1}">
                                        selected
                                    </c:if>>

                                    ${year}

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- クラス -->
                    <div class="col-md-2">

                        <label class="form-label">

                            クラス

                        </label>

                        <select class="form-select"
                                name="f2">

                            <option value="0">

                                --------

                            </option>

                            <c:forEach var="num"
                                       items="${cNumList}">

                                <option value="${num}"
                                    <c:if test="${num == f2}">
                                        selected
                                    </c:if>>

                                    ${num}

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- 科目 -->
                    <div class="col-md-4">

                        <label class="form-label">

                            科目

                        </label>

                        <select class="form-select"
                                name="f3">

                            <option value="0">

                                --------

                            </option>

                            <c:forEach var="subject"
                                       items="${subjectList}">

                                <option value="${subject.cd}"
                                    <c:if test="${subject.cd == f3}">
                                        selected
                                    </c:if>>

                                    ${subject.name}

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- ボタン -->
                    <div class="col-md-2">

                        <button type="submit"
                                class="btn btn-primary w-100">

                            検索

                        </button>

                    </div>

                </div>

            </form>


            <hr class="my-4">


            <!-- ===== 学生検索 ===== -->
            <form action="TestListStudentExecute.action"
                  method="get">

                <div class="row align-items-end g-3">

                    <!-- ラベル -->
                    <div class="col-md-2">

                        <label class="form-label fw-bold">

                            学生情報

                        </label>

                    </div>


                    <!-- 学生番号 -->
                    <div class="col-md-6">

                        <label class="form-label">

                            学生番号

                        </label>

                        <input type="text"
                               name="f4"
                               value="${f4}"
                               maxlength="10"
                               required
                               placeholder="学生番号を入力してください"
                               class="form-control">

                    </div>


                    <!-- ボタン -->
                    <div class="col-md-2">

                        <button type="submit"
                                class="btn btn-primary w-100">

                            検索

                        </button>

                    </div>

                </div>

            </form>

        </div>

    </div>


    <!-- ===== エラー ===== -->
    <c:if test="${not empty errors.get('student')}">

        <div class="alert alert-danger">

            ${errors.get("student")}

        </div>

    </c:if>


    <!-- ===== 学生情報 ===== -->
    <c:if test="${not empty student}">

        <div class="card shadow-sm mb-4">

            <div class="card-body">

                <div class="fw-bold">

                    氏名：
                    ${student.name}
                    （${student.no}）

                </div>

            </div>

        </div>

    </c:if>


    <!-- ===== 成績一覧 ===== -->
    <c:if test="${not empty f4}">

        <c:choose>

            <c:when test="${not empty tlslist}">

                <table class="table table-hover table-bordered bg-white">

                    <thead class="table-light">

                        <tr>

                            <th>
                                科目名
                            </th>

                            <th>
                                科目コード
                            </th>

                            <th>
                                回数
                            </th>

                            <th>
                                点数
                            </th>

                        </tr>

                    </thead>

                    <tbody>

                        <c:forEach var="test"
                                   items="${tlslist}">

                            <tr>

                                <td>

                                    ${test.subjectName}

                                </td>

                                <td>

                                    ${test.subjectCd}

                                </td>

                                <td>

                                    第${test.num}回

                                </td>

                                <td>

                                    ${test.point}

                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </c:when>

            <c:otherwise>

                <div class="alert alert-warning">

                    成績情報が存在しませんでした。

                </div>

            </c:otherwise>

        </c:choose>

    </c:if>


    <!-- 戻る -->
    <div class="mt-4">

        <a href="TestList.action"
           class="btn btn-outline-secondary">

            戻る

        </a>

    </div>

</div>

<%@include file="../footer.jsp" %>