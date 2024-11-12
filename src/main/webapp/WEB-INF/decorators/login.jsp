<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/9/2024
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/commons/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${URL}template/assets/images/favicon.ico" />
    <link rel="stylesheet" href="${URL}template/assets/css/backend-plugin.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/backend.css?v=1.0.0">
    <link rel="stylesheet" href="${URL}template/assets/css/all.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/line-awesome.min.css">
    <link rel="stylesheet" href="${URL}template/assets/css/remixicon.css">
</head>
<body>
<%@ include file="/commons/login/header.jsp"%>

<sitemesh:write property="body"/>

<%@ include file="/commons/login/footer.jsp"%>
</body>
</html>



