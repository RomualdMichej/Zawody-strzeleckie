<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Edycja Konkurencji</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2>DODAWANIE NOWYCH KONKURENCJI</h2>

<form:form method="post"
           modelAttribute="competition">

    <form:hidden path="id"/> <br />
    Nazwa: <form:input path="name" type="text"/> <br />

    Opis: <form:input path="description" type="text"/> <br />

    Ilość Osób: <form:input path="personQuantity" type="number"/> <br />

    Czas trwania: <form:input path="period" type="number"/> <br />


    <input type="submit" value="Zapisz!"/>

</form:form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>