<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        成績参照
    </h2>


    <!-- ===== 検索BOX ===== -->
    <div class="card shadow-sm mb-4">

        <div class="card-body">

            <!-- ===== 科目情報検索 ===== -->
            <form action="TestListSubjectExecute.action"
                  method="get">

                <div class="row align-items-end g-3">

                    <!-- タイトル -->
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
                                       items="${cNumlist}">

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
                                       items="${list}">

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

                        <input type="hidden"
                               name="f"
                               value="sj">

                        <button type="submit"
                                class="btn btn-primary w-100">

                            検索

                        </button>

                    </div>

                </div>

            </form>


            <!-- 科目検索エラー -->
            <c:if test="${not empty errors.get('subject')}">

                <div class="alert alert-danger mt-3 mb-0">

                    ${errors.get("subject")}

                </div>

            </c:if>


            <hr class="my-4">


            <!-- ===== 学生情報検索 ===== -->
            <form action="TestListStudentExecute.action"
                  method="get">

                <div class="row align-items-end g-3">

                    <!-- タイトル -->
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
                               required
                               maxlength="10"
                               placeholder="学生番号を入力してください"
                               class="form-control">

                    </div>


                    <!-- ボタン -->
                    <div class="col-md-2">

                        <input type="hidden"
                               name="f"
                               value="st">

                        <button type="submit"
                                class="btn btn-primary w-100">

                            検索

                        </button>

                    </div>

                </div>

            </form>

        </div>

    </div>

	<!-- 学生が存在しない -->
	<c:if test="${empty student && not empty f4}">

    <div class="alert alert-danger">

        学生情報が存在しませんでした。もう一度学生番号を確認してください

    </div>

	</c:if>
    <!-- 学生成績なし -->
    <c:if test="${student != null && empty tlslist}">

        <div class="alert alert-danger">

            <div class="fw-bold mb-2">

                氏名：
                ${student.name}
                （${student.no}）

            </div>

            <div>

                成績情報が存在しませんでした

            </div>

        </div>

    </c:if>


    <!-- 初期メッセージ -->
    <c:if test="${student == null && empty errors.get('subject') && empty f4}">

        <div class="alert alert-info">

            科目情報を選択または学生情報を入力して検索ボタンをクリックしてください

        </div>

    </c:if>

</div>

<%@include file="../footer.jsp" %>
