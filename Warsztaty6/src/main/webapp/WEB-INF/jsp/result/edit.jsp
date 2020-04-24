<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Edytuj Wyniki</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form:form method="post"
           modelAttribute="result">

    <form:hidden path="id"/> <br />
    <form:hidden path="competition"/> <br />
    <form:hidden path="competitor"/> <br />
    <form:hidden path="event"/> <br />
    Wyniki:<br />
    <c:forEach items="${superList}" var="s">

        <form:select path="resultList" items="${s}"/><br />

    </c:forEach><br />

    <input type="submit" value="Zapisz!"/>

</form:form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>