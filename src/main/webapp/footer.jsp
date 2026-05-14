<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>

.footer-box{
    width:100%;

    background:#f1f1f1;
    border-top:1px solid #ddd;

    padding:18px 0;
    margin-top:40px;
}

.footer-text{
    margin-bottom:4px;

    font-size:13px;
    color:#777;
}

</style>

<!-- Login後 -->
<c:if test="${not empty sessionScope.teacher}">

        </div>
        <!-- content end -->

    </div>
    <!-- container end -->

</c:if>

<!-- Login前 -->
<c:if test="${empty sessionScope.teacher}">

    </div>

</c:if>

<!-- Footer -->
<div class="footer-box">

    <p class="text-center footer-text">
        &copy; 2023 TIC
    </p>

    <p class="text-center footer-text mb-0">
        大原学園
    </p>

</div>

</body>
</html>