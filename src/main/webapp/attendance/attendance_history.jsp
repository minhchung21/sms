<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<style>

/* ===== 検索BOX ===== */
.search-card{
    border:none;
    border-radius:12px;
}


/* ===== 一覧TABLE ===== */
.table-box{
    background:#fff;
    border-radius:12px;
    overflow:hidden;
}


/* ===== 検索タイトル ===== */
.search-title{
    font-size:14px;
    font-weight:bold;
    margin-bottom:6px;
    color:#666;
}


/* ===== TABLE ===== */
.table th{
    background:#f8f9fa;
}


/* ===== 出席状況 ===== */
.status-badge{
    padding:6px 12px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}


/* 出席 */
.present{
    background:#d1e7dd;
    color:#0f5132;
}


/* 欠席 */
.absent{
    background:#f8d7da;
    color:#842029;
}


/* 遅刻 */
.late{
    background:#fff3cd;
    color:#664d03;
}


/* 早退 */
.early{
    background:#cff4fc;
    color:#055160;
}


/* ===== FILTER BUTTON ===== */
.filter-btn{
    min-width:90px;
}

</style>

<div class="page-box">

<h2 class="mb-4">
    出席参照
</h2>



<!-- ===== 検索FORM ===== -->
<form method="get"
      action="AttendanceHistory.action">

    <div class="card shadow-sm search-card mb-4">

        <div class="card-body">

            <div class="row g-3 align-items-end">

                <!-- クラス -->
                <div class="col-md-3">

                    <div class="search-title">
                        クラス
                    </div>

                    <select name="f2"
                            class="form-select">

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
                <div class="col-md-3">

                    <div class="search-title">
                        科目
                    </div>

                    <select name="f3"
                            class="form-select">

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



                <!-- 日付 -->
                <div class="col-md-3">

                    <div class="search-title">
                        日付
                    </div>

                    <input type="date"
                           name="f4"
                           value="${f4}"
                           class="form-control">

                </div>



                <!-- 検索BUTTON -->
                <div class="col-md-3">

                    <button type="submit"
                            name="search"
                            value="true"
                            class="btn btn-primary w-100">

                        検索

                    </button>

                </div>

            </div>

        </div>

    </div>

</form>



<!-- ===== SEARCH後だけ表示 ===== -->
<c:if test="${param.search != null}">



<!-- ===== FILTER ===== -->
<div class="mb-3 d-flex gap-2 flex-wrap">

    <!-- すべて -->
    <a href="AttendanceHistory.action?search=true&f2=${f2}&f3=${f3}&f4=${f4}"
       class="btn btn-outline-secondary filter-btn">

        すべて

    </a>



    <!-- 出席 -->
    <a href="AttendanceHistory.action?search=true&f2=${f2}&f3=${f3}&f4=${f4}&f5=出席"
       class="btn btn-outline-success filter-btn">

        出席

    </a>



    <!-- 欠席 -->
    <a href="AttendanceHistory.action?search=true&f2=${f2}&f3=${f3}&f4=${f4}&f5=欠席"
       class="btn btn-outline-danger filter-btn">

        欠席

    </a>



    <!-- 遅刻 -->
    <a href="AttendanceHistory.action?search=true&f2=${f2}&f3=${f3}&f4=${f4}&f5=遅刻"
       class="btn btn-outline-warning filter-btn">

        遅刻

    </a>



    <!-- 早退 -->
    <a href="AttendanceHistory.action?search=true&f2=${f2}&f3=${f3}&f4=${f4}&f5=早退"
       class="btn btn-outline-info filter-btn">

        早退

    </a>

</div>



<!-- ===== TABLE ===== -->
<div class="table-box shadow-sm">

    <table class="table table-hover align-middle mb-0">

        <thead>

            <tr>

                <th>
                    日付
                </th>

                <th>
                    クラス
                </th>

                <th>
                    学生番号
                </th>

                <th>
                    氏名
                </th>

                <th>
                    科目
                </th>

                <th>
                    出席状況
                </th>

            </tr>

        </thead>

        <tbody>

            <c:choose>

                <c:when test="${not empty attendanceList}">

                    <c:forEach var="a"
                               items="${attendanceList}">

                        <tr>

                            <td>
                                ${a.attendanceDate}
                            </td>

                            <td>
                                ${a.student.classNum}
                            </td>

                            <td>
                                ${a.student.no}
                            </td>

                            <td>
                                ${a.student.name}
                            </td>

                            <td>
                                ${a.subject.name}
                            </td>

                            <td>

                                <span class="status-badge
                                    <c:choose>
                                        <c:when test="${a.status == '出席'}">
                                            present
                                        </c:when>
                                        <c:when test="${a.status == '欠席'}">
                                            absent
                                        </c:when>
                                        <c:when test="${a.status == '遅刻'}">
                                            late
                                        </c:when>
                                        <c:otherwise>
                                            early
                                        </c:otherwise>
                                    </c:choose>
                                ">

                                    ${a.status}

                                </span>

                            </td>

                        </tr>

                    </c:forEach>

                </c:when>

                <c:otherwise>

                    <tr>

                        <td colspan="6"
                            class="text-center text-muted py-4">

                            データがありません

                        </td>

                    </tr>

                </c:otherwise>

            </c:choose>

        </tbody>

    </table>

</div>

</c:if>

</div>

<%@ include file="../footer.jsp" %>