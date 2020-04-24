<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Czy na pewno chcesz usunac zrezygnować z tego startu?</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2>Czy na pewno chcesz usunac zrezygnować z tego startu?</h2>
<input type="hidden" name="toReduceStartId" value="${start.id}">
<input type="hidden" name="competitorId" value="${competitor.id}">
<form:form method="post"
           modelAttribute="viewHelper">
    <form:hidden path="option" value="confirmed"/>
    <input type="submit" value="Tak!">
</form:form>
<form:form method="post"
           modelAttribute="viewHelper">
    <form:hidden path="option" value="non-confirmed"/>
    <input type="submit" value="Nie!">
</form:form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>