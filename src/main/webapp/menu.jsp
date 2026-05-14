<%@page contentType="text/html; charset=UTF-8" %>

<%@ include file="../header.jsp" %>

<style>

.menu-card{
    height:180px;
    transition:0.2s;
}

.menu-card:hover{
    transform:translateY(-4px);
}

.student-card{
    background:#f5d7d7;
}

.score-card{
    background:#dff0df;
}

.subject-card{
    background:#dfe7f7;
}

.class-card{
    background:#f5efd7;
}

.menu-link{
    font-size:28px;
    text-decoration:none;
    color:#212529;
    font-weight:bold;
}

.menu-link:hover{
    opacity:0.8;
}

.score-title{
    font-size:24px;
    font-weight:bold;
    margin-bottom:16px;
    color:#212529;
}

.score-link{
    text-decoration:none;
    color:#0d6efd;
    font-weight:500;
}

.score-link:hover{
    text-decoration:underline;
}

</style>

<!-- タイトル -->
<h2 class="mb-4">
    メニュー
</h2>

<!-- Menu Box -->
<div class="row text-center g-4 mt-3">

    <!-- 学生管理 -->
    <div class="col-12 col-sm-6 col-md-3">

        <div class="menu-card
                    student-card
                    shadow
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center">

            <a href="../student/StudentList.action"
               class="menu-link">

                学生管理

            </a>

        </div>

    </div>


    <!-- 成績管理 -->
    <div class="col-12 col-sm-6 col-md-3">

        <div class="menu-card
                    score-card
                    shadow
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center">

            <div>

                <div class="score-title">
                    成績管理
                </div>

                <div class="mb-2">

                    <a href="../test/TestRegist.action"
                       class="score-link">

                        成績登録

                    </a>

                </div>

                <div>

                    <a href="../test/TestList.action"
                       class="score-link">

                        成績参照

                    </a>

                </div>

            </div>

        </div>

    </div>


    <!-- 科目管理 -->
    <div class="col-12 col-sm-6 col-md-3">

        <div class="menu-card
                    subject-card
                    shadow
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center">

            <a href="../subject/SubjectList.action"
               class="menu-link">

                科目管理

            </a>

        </div>

    </div>


    <!-- クラス管理 -->
    <div class="col-12 col-sm-6 col-md-3">

        <div class="menu-card
                    class-card
                    shadow
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center">

            <a href="../classnum/ClassList.action"
               class="menu-link">

                クラス管理

            </a>

        </div>

    </div>

</div>

<%@include file="../footer.jsp" %>
