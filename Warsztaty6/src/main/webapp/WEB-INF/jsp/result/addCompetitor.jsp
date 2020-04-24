<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Wybierz zwodnika</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form method="post">

    <select name="competitorId">

    <c:forEach items="${competitorList}" var="competitor">

        <option value="${competitor.id}">${competitor.fullName}</option>

    </c:forEach>
    </select>

    <input type="submit" value="Wybierz!"/>
</form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
