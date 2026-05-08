<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@include file="../header.jsp" %>

<div style="
    width:420px;
    margin:40px auto;
    border:1px solid #ddd;
    background:#fff;
">

    <!-- タイトル -->
    <div style="
        background:#eee;
        padding:10px;
        text-align:center;
        font-size:18px;
        font-weight:bold;
    ">
        ログイン
    </div>


    <!-- フォーム -->
    <div style="padding:20px;">

        <form action="LoginExecute.action" method="post">

            <!-- ID -->
            <div style="margin-bottom:12px;">

                <input type="text"
                       name="id"
                       placeholder="ＩＤ"
                       required

                       style="
                            width:100%;
                            height:40px;
                            padding:0 10px;
                            border:1px solid #ccc;
                            border-radius:4px;
                            box-sizing:border-box;
                            background:#eef3fb;
                       ">

            </div>


            <!-- PASSWORD -->
            <div style="margin-bottom:12px;">

                <input type="password"
                       name="password"
                       id="password"
                       placeholder="パスワード"
                       required

                       style="
                            width:100%;
                            height:40px;
                            padding:0 10px;
                            border:1px solid #ccc;
                            border-radius:4px;
                            box-sizing:border-box;
                            background:#eef3fb;
                       ">

            </div>


            <!-- CHECK -->
            <div style="
                text-align:center;
                margin-bottom:15px;
                font-size:14px;
            ">

                <label>

                    <input type="checkbox"
                           onclick="
                                const p =
                                document.getElementById('password');

                                p.type =
                                p.type === 'password'
                                ? 'text'
                                : 'password';
                           ">

                    パスワードを表示

                </label>

            </div>


            <!-- BUTTON -->
            <div style="text-align:center;">

                <button type="submit"
                        style="
                            width:120px;
                            height:38px;
                            border:none;
                            border-radius:5px;
                            background:#0d6efd;
                            color:#fff;
                            font-size:14px;
                            cursor:pointer;
                        ">
                    ログイン
                </button>

            </div>

        </form>


        <!-- MESSAGE -->
        <c:if test="${not empty message}">

            <div style="
                color:red;
                margin-top:15px;
                text-align:center;
            ">
                ${message}
            </div>

        </c:if>

    </div>

</div>
<%@include file="../footer.html" %>