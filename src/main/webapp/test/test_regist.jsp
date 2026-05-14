<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

<h2 class="mb-4">成績管理</h2>

<form method="get" action="TestRegist.action">

    <div class="card shadow-sm mb-4">
        <div class="card-body">

            <div class="row g-3 align-items-end">

                <!-- 入学年度 -->
                <div class="col-md-2">
                    <label class="form-label">入学年度</label>
                    <select name="f1" class="form-select">
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
                    <select name="f2" class="form-select">
                        <option value="0">--------</option>

                        <c:forEach var="num" items="${cNumList}">
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
                    <select name="f3" class="form-select">
                        <option value="">--------</option>

                        <c:forEach var="subject" items="${subjectList}">
                            <option value="${subject.cd}"
                                <c:if test="${subject.cd == f3}">selected</c:if>>
                                ${subject.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- 回数 -->
                <div class="col-md-2">
                    <label class="form-label">回数</label>
                    <select name="f4" class="form-select">
                        <option value="0">--------</option>

                        <c:forEach var="num" items="${countSet}">
                            <option value="${num}"
                                <c:if test="${num == f4}">selected</c:if>>
                                ${num}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-2">
                    <button class="btn btn-primary w-100">検索</button>
                </div>

            </div>

        </div>
    </div>
</form>

<!-- ===== RESULT FORM ===== -->
<c:if test="${not empty testList}">

<form action="TestRegistExecute.action" method="post">

    <input type="hidden" name="f1" value="${f1}">
    <input type="hidden" name="f2" value="${f2}">
    <input type="hidden" name="f3" value="${f3}">
    <input type="hidden" name="f4" value="${f4}">

    <div class="mb-3 fw-bold">
        科目：${subjectName}（${f4}回）
    </div>

    <table class="table table-bordered table-hover bg-white">

        <thead class="table-light">
            <tr>
                <th>入学年度</th>
                <th>クラス</th>
                <th>学生番号</th>
                <th>氏名</th>
                <th>点数</th>
            </tr>
        </thead>

        <tbody>

            <c:forEach var="test" items="${testList}" varStatus="st">

                <tr>
                    <td>${test.student.entYear}</td>
                    <td>${test.classNum}</td>
                    <td>${test.student.no}</td>
                    <td>${test.student.name}</td>

                    <td>
                        <input type="text"
                               name="point_${test.student.no}"
                               value="${test.point}"
                               class="form-control">

                        <c:if test="${not empty errors[st.count]}">
                            <div class="text-danger small">
                                ${errors[st.count]}
                            </div>
                        </c:if>
                    </td>
                </tr>

                <input type="hidden"
                       name="regist"
                       value="${test.student.no}">

            </c:forEach>

        </tbody>
    </table>

    <button type="submit" class="btn btn-success">
        登録して終了
    </button>

</form>

</c:if>

</div>

<%@include file="../footer.jsp" %>