<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 style="background:#eee; padding:10px;">学生管理</h2>

<!-- 新規登録 -->
	 <div style="text-align:right; margin:10px 0;">
        <a href="StudentCreate.action">新規登録</a>
    </div>

<!-- 検索フォーム -->
<form method="get">

<div class="row border mx-3 mb-3 py-2 align-items-center rounded">

    <!-- 入学年度選択 -->
    <div class="col-4">
        <label>入学年度</label>
        <select name="f1">
            <!-- 未選択用 -->
            <option value="0">--------</option>

            <!-- 年度一覧をループ -->
            <c:forEach var="year" items="${ent_year_set}">
                <option value="${year}" <c:if test="${year == f1 + 0}">selected</c:if>>${year}</option>
            </c:forEach>

        </select>
    </div>

    <!-- クラス選択 -->
    <div class="col-4">
        <label>クラス</label>
        <select name="f2">
            <!-- 未選択用 -->
            <option value="0">--------</option>

            <!-- クラス番号一覧 -->
            <c:forEach var="num" items="${class_num_set}">
                <!-- 選択状態を保持 -->
                <option value="${num}" <c:if test="${num == f2}">selected</c:if>>${num}</option>
            </c:forEach>

        </select>
    </div>

    <!-- 在学チェック -->
    <div class="col-2">
        <label>
            在学中
            <!-- チェック状態を保持 -->
            <input type="checkbox" name="f3"
                   <c:if test="${not empty f3}">checked</c:if> />
        </label>
    </div>

    <!-- 検索ボタン -->
    <div class="col-2">
        <button>絞込み</button>
    </div>

</div>

<!-- エラーメッセージ表示 -->
<c:if test="${not empty errors.f1}">
    <div style="color:red">
        ${errors.f1}
    </div>
</c:if>

</form>

<!-- 検索結果表示 -->
<c:choose>

<c:when test="${not empty students}">
    <!-- 件数表示 -->
    <div>検索結果：${students.size()}件</div>

    <table style="width:100%; border-collapse:collapse; background:#fff;">

    <!-- header -->
    <tr style="border-bottom:2px solid #ccc;">

        <th style="text-align:left; padding:12px 10px;">入学年度</th>
		<th style="text-align:left; padding:12px 10px;">学生番号</th>
		<th style="text-align:left; padding:12px 10px;">氏名</th>
		<th style="text-align:center; padding:12px 10px; width:100px;">クラス</th>
		<th style="text-align:center; padding:12px 10px; width:100px;">在学中</th>

        <th style="text-align:center; padding:12px 10px; width:100px;">
        </th>

    </tr>

        <!-- 学生リストをループ -->
        <c:forEach var="stu" items="${students}">
            <tr>
                <td>${stu.entYear}</td>
                <td>${stu.no}</td>
                <td>${stu.name}</td>
                <td>${stu.classNum}</td>

                <!-- 在学フラグ表示 -->
                <td>
                    <c:choose>
                        <c:when test="${stu.attend}">○</c:when>
                        <c:otherwise>×</c:otherwise>
                    </c:choose>
                </td>

                <!-- 更新画面へのリンク -->
                <td>
                    <a href="StudentUpdate.action?no=${stu.no}">変更</a>
                </td>
            </tr>
        </c:forEach>

    </table>
</c:when>

<c:otherwise>
    <!-- データがない場合 -->
    <div>学生情報が存在しませんでした。</div>
</c:otherwise>

</c:choose>

<div style="margin-top:20px;">
    <a href="../auth/Menu.action" style="margin-right:20px;">
        メニューへ戻る
    </a>
</div>

</section>

</section>