<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<section style="padding:20px;">

<!-- タイトル -->
<h2 style="
    background:#eee;
    padding:10px 15px;
    margin-bottom:20px;
">
    学生情報登録
</h2>

<form action="StudentCreateExecute.action"
      method="post"
      style="max-width:920px;">

    <!-- 入学年度 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            入学年度
        </label>

        <select name="ent_year"
                style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
                    background:#fff;
                ">

            <option value="0">--------</option>

            <option value="2024"
                <c:if test="${ent_year == 2024}">
                    selected
                </c:if>>
                2024
            </option>

            <option value="2025"
                <c:if test="${ent_year == 2025}">
                    selected
                </c:if>>
                2025
            </option>

            <option value="2026"
                <c:if test="${ent_year == 2026}">
                    selected
                </c:if>>
                2026
            </option>

            <option value="2027"
                <c:if test="${ent_year == 2027}">
                    selected
                </c:if>>
                2027
            </option>

        </select>

        <c:if test="${not empty errors.entYear}">
            <div style="color:red; margin-top:4px;">
                ${errors.entYear}
            </div>
        </c:if>

    </div>


    <!-- 学生番号 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            学生番号
        </label>

        <input type="text"
               name="no"
               value="${no}"
               maxlength="10"
               placeholder="学生番号を入力してください"
               required

               style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
               ">

        <c:if test="${not empty errors.no}">
            <div style="color:red; margin-top:4px;">
                ${errors.no}
            </div>
        </c:if>

    </div>


    <!-- 氏名 -->
    <div style="margin-bottom:14px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            氏名
        </label>

        <input type="text"
               name="name"
               value="${name}"
               maxlength="30"
               placeholder="氏名を入力してください"
               required

               style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
               ">

        <c:if test="${not empty errors.name}">
            <div style="color:red; margin-top:4px;">
                ${errors.name}
            </div>
        </c:if>

    </div>


    <!-- クラス -->
    <div style="margin-bottom:18px;">

        <label style="
            display:block;
            margin-bottom:4px;
        ">
            クラス
        </label>

        <select name="class_num"
                style="
                    width:100%;
                    height:34px;
                    padding:0 10px;
                    border:1px solid #ccc;
                    border-radius:4px;
                    box-sizing:border-box;
                    background:#fff;
                ">

            <c:forEach var="num" items="${classnum}">

                <option value="${num}"
                    <c:if test="${class_num == num}">
                        selected
                    </c:if>>

                    ${num}

                </option>

            </c:forEach>

        </select>

    </div>


    <!-- ボタン -->
    <div style="margin-top:8px;">

        <button type="submit"
                style="
                    height:36px;
                    padding:0 18px;
                    border:none;
                    border-radius:4px;
                    background:#666;
                    color:#fff;
                    cursor:pointer;
                ">
            登録して終了
        </button>

    </div>

</form>


<div style="margin-top:14px;">

    <a href="StudentList.action">
        戻る
    </a>

</div>

</section>