<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">
    <!-- タイトル -->
    <h2 style="background:#eee; padding:10px;">科目管理</h2>

	<!-- 新規登録 -->
	 <div style="text-align:right; margin:10px 0;">
        <a href="SubjectCreate.action">新規登録</a>
    </div>
	

<c:choose>

<c:when test="${not empty subjects}">

    <!-- 件数表示 -->
    <%--<div>検索結果：${subjects.size()}件</div> --%>
	<table style="width:100%; border-collapse:collapse;">
	
    <!-- header -->
        <tr style="border-bottom:2px solid #ccc;">
            <th style="text-align:left; padding:10px;">科目コード</th>
            <th style="text-align:left; padding:10px;">科目名</th>
            <th style="padding:10px;"></th>
        </tr>

     <!-- data -->
        <c:forEach var="sub" items="${subjects}">
            <tr style="border-bottom:1px solid #ddd;">
                <td style="padding:10px;">
                    ${sub.cd}
                </td>

                <td style="padding:10px;">
                    ${sub.name}
                </td>

                <!-- 更新リンク -->
                <td style="padding:10px;">
                    <a href="SubjectUpdate.action?cd=${sub.cd}" 
                       style="margin-right:15px;">
                        変更
                    </a>

                    <a href="SubjectDelete.action?cd=${sub.cd}">
                        削除
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

</c:when>

<c:otherwise>
    <div style="margin-top:10px;">科目情報が存在しませんでした。</div>
</c:otherwise>

</c:choose>

<!-- メニュー戻る -->
<div style="margin-top:20px;">
    <a href="../auth/Menu.action">メニューへ戻る</a>
</div>

</section>