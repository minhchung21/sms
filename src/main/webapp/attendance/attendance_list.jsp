<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<style>

.search-card{
    border:none;
    border-radius:12px;
    background:#ffffff;
}

.search-title{
    font-size:15px;
    font-weight:bold;
    color:#666;
    margin-bottom:6px;
}

.table-box{
    background:#fff;
    border-radius:12px;
    overflow:hidden;
}

.register-btn{
    min-width:180px;
    height:45px;
    font-weight:bold;
    border-radius:10px;
}

.date-card{
    width:240px;
    border:none;
    border-radius:12px;
    background:#ffffff;
}

.date-title{
    font-size:14px;
    color:#666;
    margin-bottom:8px;
    font-weight:bold;
}

input[type="date"]{
    height:42px;
    border-radius:8px;
}

.table th{
    background:#f8f9fa;
    font-weight:bold;
    color:#555;
}

.table td{
    vertical-align:middle;
}

.status-select{
    min-width:130px;
}

</style>

<div class="page-box">

<h2 class="mb-4">
    出席管理
</h2>

<!-- ===== 検索フォーム ===== -->
<form method="get"
      action="AttendanceList.action">

    <div class="card shadow-sm search-card mb-4">

        <div class="card-body">

            <div class="row g-3 align-items-end">

                <!-- 入学年度 -->
                <div class="col-md-3">

                    <div class="search-title">
                        入学年度
                    </div>

                    <select name="f1"
                            class="form-select">

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
                <div class="col-md-4">

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



                <!-- 検索 -->
                <div class="col-md-2">

                    <button type="submit"
                            name="search"
                            class="btn btn-primary w-100">

                        検索

                    </button>

                </div>

            </div>

        </div>

    </div>

</form>



<!-- ===== エラー ===== -->
<c:if test="${not empty errors['1']}">

    <div class="alert alert-danger">

        ${errors["1"]}

    </div>

</c:if>



<!-- ===== 学生一覧 ===== -->
<c:if test="${not empty studentList}">

<form action="AttendanceExecute.action"
      method="post">

    <!-- hidden -->
    <input type="hidden"
           name="f3"
           value="${f3}">

    <!-- ===== 日付 ===== -->
    <div class="card shadow-sm date-card mb-4">

        <div class="card-body">

            <div class="date-title">
                出席日付
            </div>

            <div class="input-group">

                <span class="input-group-text bg-white">
                    📅
                </span>

                <input type="date"
                       name="f4"
                       value="${f4}"
                       class="form-control"
                       required
                       min="2000-01-01"
                       max="2099-12-31"
                       oninvalid="this.setCustomValidity('日付を入力してください')"
                       oninput="this.setCustomValidity('')">

            </div>

        </div>

    </div>



    <!-- ===== TABLE ===== -->
    <div class="table-box shadow-sm">

        <table class="table table-hover align-middle mb-0">

            <thead>

                <tr>

                    <th>
                        入学年度
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

                    <th style="width:180px;">
                        出席状況
                    </th>

                </tr>

            </thead>

            <tbody>

                <c:forEach var="student"
                           items="${studentList}">

                    <tr>

                        <td>
                            ${student.entYear}
                        </td>

                        <td>
                            ${student.classNum}
                        </td>

                        <td>
                            ${student.no}
                        </td>

                        <td>
                            ${student.name}
                        </td>

                        <td>

                            <select
                                name="status_${student.no}"
                                class="form-select status-select"
                                required
                                oninvalid="this.setCustomValidity('出席状況を選択してください')"
                                oninput="this.setCustomValidity('')">

                                <option value=""
                                        selected
                                        disabled>

                                    -------

                                </option>

                                <option value="出席">
                                    出席
                                </option>

                                <option value="欠席">
                                    欠席
                                </option>

                                <option value="遅刻">
                                    遅刻
                                </option>

                                <option value="早退">
                                    早退
                                </option>

                            </select>

                        </td>

                    </tr>

                    <!-- hidden -->
                    <input type="hidden"
                           name="regist"
                           value="${student.no}">

                </c:forEach>

            </tbody>

        </table>

    </div>



    <!-- ===== BUTTON ===== -->
    <div class="mt-4">

        <button type="submit"
                class="btn btn-success register-btn">

            登録して終了

        </button>

    </div>

</form>

</c:if>

</div>

<%@ include file="../footer.jsp" %>