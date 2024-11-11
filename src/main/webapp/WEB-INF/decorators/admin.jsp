<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/9/2024
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/commons/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>POS Dash | Responsive Bootstrap 4 Admin Dashboard Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="${URL}template/assets/images/favicon.ico" />
    <link rel="stylesheet" href="${URL}template/assets/css/backend-plugin.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/backend.css?v=1.0.0">
    <link rel="stylesheet" href="${URL}template/assets/css/all.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/line-awesome.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/remixicon.css">
</head>
<body class="  ">
<!-- loader Start -->
<div id="loading">
    <div id="loading-center">
    </div>
</div>
<!-- loader END -->
<!-- Wrapper Start -->
<div class="wrapper">
    <%@include file="/commons/admin/header.jsp"%>

    <!-- Content of page, call by jsp syntax-->
    <div class="main-wrapper">
        <div class="container">
            <sitemesh:write property="body"/>
        </div>
    </div>
    <!-- Content of page, call by jsp syntax-->
    
</div>
<%@include file="/commons/admin/footer.jsp"%>
<!-- Backend Bundle JavaScript -->
<script src="${URL}template/assets/js/backend-bundle.min.js"></script>

<!-- Table Treeview JavaScript -->
<script src="${URL}template/assets/js/table-treeview.js"></script>

<!-- Chart Custom JavaScript -->
<script src="${URL}template/assets/js/customizer.js"></script>

<!-- Chart Custom JavaScript -->
<script async src="${URL}template/assets/js/chart-custom.js"></script>

<!-- app JavaScript -->
<script src="${URL}template/assets/js/app.js"></script>
</body>
</html>
