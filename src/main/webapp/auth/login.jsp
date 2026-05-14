<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@include file="../header.jsp" %>

<style>

.login-box{
    width:420px;
    margin:40px auto;
    border:1px solid #ddd;
    background:#fff;
}

.login-title{
    background:#eee;
    padding:10px;
    text-align:center;
    font-size:18px;
    font-weight:bold;
}

.login-body{
    padding:20px;
}

.login-input{
    width:100%;
    height:40px;
    padding:0 10px;
    border:1px solid #ccc;
    border-radius:4px;
    box-sizing:border-box;
    background:#eef3fb;
}

.password-check{
    text-align:center;
    margin-bottom:15px;
    font-size:14px;
}

.login-btn-area{
    text-align:center;
}

.login-btn{
    width:120px;
    height:38px;
    border:none;
    border-radius:5px;
    background:#0d6efd;
    color:#fff;
    font-size:14px;
    cursor:pointer;
}

.login-btn:hover{
    opacity:0.9;
}

.error-message{
    color:red;
    margin-top:15px;
    text-align:center;
}

.mb-12{
    margin-bottom:12px;
}

</style>

<div class="login-box">

    <!-- タイトル -->
    <div class="login-title">
        ログイン
    </div>

    <!-- フォーム -->
    <div class="login-body">

        <form action="LoginExecute.action" method="post">

            <!-- ID -->
            <div class="mb-12">

                <input type="text"
                       name="id"
                       placeholder="ＩＤ"
                       required
                       class="login-input">

            </div>

            <!-- PASSWORD -->
            <div class="mb-12">

                <input type="password"
                       name="password"
                       id="password"
                       placeholder="パスワード"
                       required
                       class="login-input">

            </div>

            <!-- CHECK -->
            <div class="password-check">

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
            <div class="login-btn-area">

                <button type="submit"
                        class="login-btn">
                    ログイン
                </button>

            </div>

        </form>

        <!-- MESSAGE -->
        <c:if test="${not empty message}">

            <div class="error-message">
                ${message}
            </div>

        </c:if>

    </div>

</div>

<%@include file="../footer.jsp" %>