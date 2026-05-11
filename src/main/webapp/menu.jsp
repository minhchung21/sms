<%@page contentType="text/html; charset=UTF-8" %>

<%@ include file="../header.jsp" %>

<!-- タイトル -->
<h2 class="mb-4">
    メニュー
</h2>

<!-- Menu Box -->
<div class="row text-center g-4 mt-3">

    <!-- 学生管理 -->
    <div class="col-md-3">

        <div class="shadow rounded d-flex
                    align-items-center
                    justify-content-center"

             style="
                    height:180px;
                    background:#dbb;
             ">

            <a href="../student/StudentList.action"
               class="fs-4 text-decoration-none text-dark fw-bold">

                学生管理

            </a>

        </div>

    </div>


    <!-- 成績管理 -->
    <div class="col-md-3">

        <div class="shadow rounded d-flex
                    align-items-center
                    justify-content-center"

             style="
                    height:180px;
                    background:#bdb;
             ">

            <div>

                <div class="fs-4 fw-bold mb-3">
                    成績管理
                </div>

                <div class="mb-2">

                    <a href="#"
                       class="text-decoration-none">

                        成績登録

                    </a>

                </div>

                <div>

                    <a href="#"
                       class="text-decoration-none">

                        成績参照

                    </a>

                </div>

            </div>

        </div>

    </div>


    <!-- 科目管理 -->
    <div class="col-md-3">

        <div class="shadow rounded d-flex
                    align-items-center
                    justify-content-center"

             style="
                    height:180px;
                    background:#bbd;
             ">

            <a href="../subject/SubjectList.action"
               class="fs-4 text-decoration-none text-dark fw-bold">

                科目管理

            </a>

        </div>

    </div>


    <!-- クラス管理 -->
    <div class="col-md-3">

        <div class="shadow rounded d-flex
                    align-items-center
                    justify-content-center"

             style="
                    height:180px;
                    background:#ddb;
             ">

            <a href="../classnum/ClassList.action"
               class="fs-4 text-decoration-none text-dark fw-bold">

                クラス管理

            </a>

        </div>

    </div>

</div>


