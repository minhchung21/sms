<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        クラス管理
    </h2>


    <!-- 新規登録 -->
    <div class="text-end mb-3">

        <a href="ClassCreate.action"
           class="btn btn-primary">

            新規登録

        </a>

    </div>



    <!-- ===== 一覧 ===== -->
    <c:if test="${not empty list}">

        <table class="table table-hover table-bordered bg-white">

            <!-- header -->
            <thead class="table-light">

                <tr>

                    <th>
                        クラス番号
                    </th>

                    <th class="text-center" style="width:200px;">
                    </th>

                </tr>

            </thead>


            <!-- data -->
            <tbody>

                <c:forEach var="class_num" items="${list}">

                    <tr>

                        <td>
                            ${class_num}
                        </td>

                        <!-- ボタン -->
                        <td class="text-center">

                            <a href="ClassUpdate.action?class_num=${class_num}"
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
    <c:if test="${empty list}">

        <div class="alert alert-warning">

            クラス情報が存在しませんでした。

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