<script>

    $(function() {
        $.get("${pageContext.request.contextPath}/category/findAllFirstCategory.do", {}, function(data) {
            let asideHtml = "";
            let categoryCode = getParameter("categoryCode") + "";
            for( i = 0; i < data.length; i++) {
                if (data[i].code == categoryCode.substring(0, 4)) {
                    asideHtml += '<a href="${pageContext.request.contextPath}/product/index.do?categoryCode='+data[i].code+'" class="list-group-item active">'+data[i].name+'</a>';
                } else {
                    asideHtml += '<a href="${pageContext.request.contextPath}/product/index.do?categoryCode='+data[i].code+'" class="list-group-item">'+data[i].name+'</a>';
                }
            }
            $("#aside").html(asideHtml);
        }, "JSON")
    })

</script>

<!-- 侧边导航开始 -->
<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
     role="navigation">
    <div class="list-group" id = "aside">
        <%--侧边栏内容--%>
    </div>
</div>
<!--  侧边导航结束 -->