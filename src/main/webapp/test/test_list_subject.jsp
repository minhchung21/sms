<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <h2 class="mb-4">
        成績一覧（科目）
    </h2>

    <!-- ===== SEARCH BOX ===== -->
    <div class="card shadow-sm mb-4">

        <div class="card-body">

            <!-- ===== 科目検索 ===== -->
            <form action="TestListSubjectExecute.action" method="get">

                <div class="row align-items-end g-3">

                    <div class="col-md-2">
                        <label class="form-label fw-bold">科目情報</label>
                    </div>

                    <!-- 入学年度 -->
                    <div class="col-md-2">
                        <label class="form-label">入学年度</label>
                        <select class="form-select" name="f1">
                            <option value="0">--------</option>

                            <c:forEach var="year" items="${entYearSet}">
                                <option value="${year}"
                                    <c:if test="${year == f1}">selected</c:if>>
                                    ${year}
                                </option>
                            </c:forEach>

                        </select>
                    </div>

                    <!-- クラス -->
                    <div class="col-md-2">
                        <label class="form-label">クラス</label>
                        <select class="form-select" name="f2">
                            <option value="0">--------</option>

                            <c:forEach var="num" items="${cNumlist}">
                                <option value="${num}"
                                    <c:if test="${num == f2}">selected</c:if>>
                                    ${num}
                                </option>
                            </c:forEach>

                        </select>
                    </div>

                    <!-- 科目 -->
                    <div class="col-md-4">
                        <label class="form-label">科目</label>
                        <select class="form-select" name="f3">
                            <option value="0">--------</option>

                            <c:forEach var="subject" items="${list}">
                                <option value="${subject.cd}"
                                    <c:if test="${subject.cd == f3}">selected</c:if>>
                                    ${subject.name}
                                </option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">
                            検索
                        </button>
                    </div>

                </div>
            </form>

            <hr class="my-4">

            <!-- ===== 学生検索 ===== -->
            <form action="TestListStudentExecute.action" method="get">

                <div class="row align-items-end g-3">

                    <div class="col-md-2">
                        <label class="form-label fw-bold">学生情報</label>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">学生番号</label>
                        <input type="text" name="f4"
                               value="${f4}"
                               class="form-control"
                               placeholder="学生番号を入力してください">
                    </div>

                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">
                            検索
                        </button>
                    </div>

                </div>

            </form>

        </div>
    </div>

    <!-- ===== SUBJECT NAME ===== -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <div class="fw-bold">
                科目：${subject_name}
            </div>
        </div>
    </div>

    <!-- ===== LIST ===== -->
    <c:choose>

        <c:when test="${not empty tlslist}">

            <table class="table table-hover table-bordered bg-white">

                <thead class="table-light">
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>1回</th>
                        <th>2回</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="test" items="${tlslist}">

                        <tr>

                            <td>${test.entYear}</td>
                            <td>${test.classNum}</td>
                            <td>${test.studentNo}</td>
                            <td>${test.studentName}</td>

                            <td>${test.getPoint(1)}</td>
							<td>${test.getPoint(2)}</td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </c:when>

        <c:otherwise>

            <div class="alert alert-danger">
                検索条件に該当する成績情報が存在しませんでした
            </div>

        </c:otherwise>

    </c:choose>

    <!-- BACK -->
    <div class="mt-4">
        <a href="TestList.action" class="btn btn-outline-secondary">
            戻る
        </a>
    </div>

</div>

<%@include file="../footer.jsp" %>