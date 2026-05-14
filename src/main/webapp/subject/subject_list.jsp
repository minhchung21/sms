<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        科目管理
    </h2>


    <!-- 新規登録 -->
    <div class="text-end mb-3">

        <a href="SubjectCreate.action"
           class="btn btn-primary">

            新規登録

        </a>

    </div>



    <!-- ===== 一覧 ===== -->
    <c:if test="${not empty subjects}">

        <table class="table table-hover table-bordered bg-white">

            <!-- header -->
            <thead class="table-light">

                <tr>

                    <th>
                        科目コード
                    </th>

                    <th>
                        科目名
                    </th>

                    <th class="text-center" style="width:200px;">
                    </th>

                </tr>

            </thead>


            <!-- data -->
            <tbody>

                <c:forEach var="sub" items="${subjects}">

                    <tr>

                        <td>
                            ${sub.cd}
                        </td>

                        <td>
                            ${sub.name}
                        </td>

                        <!-- ボタン -->
                        <td class="text-center">

                            <a href="SubjectUpdate.action?cd=${sub.cd}"
                               class="btn btn-sm btn-outline-primary me-2">

                                変更

                            </a>

                            <a href="SubjectDelete.action?cd=${sub.cd}"
                               class="btn btn-sm btn-outline-danger">

                                削除

                            </a>

                        </td>

                    </tr>

                </c:forEach>

            </tbody>

        </table>

    </c:if>



    <!-- データなし -->
    <c:if test="${empty subjects}">

        <div class="alert alert-warning">

            科目情報が存在しませんでした。

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
