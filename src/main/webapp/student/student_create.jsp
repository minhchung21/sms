<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../header.jsp" %>

<div class="page-box">

    <!-- タイトル -->
    <h2 class="mb-4">
        学生情報登録
    </h2>


    <!-- Form -->
    <form action="StudentCreateExecute.action"
          method="post"
          style="max-width:700px;">


        <!-- 入学年度 -->
        <div class="mb-3">

            <label class="form-label">
                入学年度
            </label>

            <select name="ent_year"
                    class="form-select">

                <option value="0">
                    --------
                </option>

                <c:forEach begin="${nowYear - 2}" 
                			end="${nowYear + 1}" 
                			var="year"> 
                			
                	<option value="${year}" 
                		<c:if test="${ent_year == year}"> 
                			selected 
                		</c:if>>
                		 ${year} 
                	</option> 
                	
                </c:forEach>

            </select>

            <c:if test="${not empty errors.entYear}">

                <div class="text-danger mt-1">

                    ${errors.entYear}

                </div>

            </c:if>

        </div>



        <!-- 学生番号 -->
        <div class="mb-3">

            <label class="form-label">
                学生番号
            </label>

            <input type="text"
                   name="no"
                   value="${no}"
                   maxlength="10"
                   placeholder="学生番号を入力してください"
                   required
                   class="form-control">

            <c:if test="${not empty errors.no}">

                <div class="text-danger mt-1">

                    ${errors.no}

                </div>

            </c:if>

        </div>



        <!-- 氏名 -->
        <div class="mb-3">

            <label class="form-label">
                氏名
            </label>

            <input type="text"
                   name="name"
                   value="${name}"
                   maxlength="30"
                   placeholder="氏名を入力してください"
                   required
                   class="form-control">

            <c:if test="${not empty errors.name}">

                <div class="text-danger mt-1">

                    ${errors.name}

                </div>

            </c:if>

        </div>



        <!-- クラス -->
        <div class="mb-4">

            <label class="form-label">
                クラス
            </label>

            <select name="class_num"
                    class="form-select">

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
        <div class="d-flex gap-2">

            <button type="submit"
                    class="btn btn-primary">

                登録して終了

            </button>

            <a href="StudentList.action"
               class="btn btn-outline-secondary">

                戻る

            </a>

        </div>

    </form>

</div>

<%@include file="../footer.jsp" %>
