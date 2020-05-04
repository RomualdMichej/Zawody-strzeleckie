<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Edycja Zawodów</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2>DODAWANIE NOWYCH ZAWODÓW</h2>

<form:form method="post"
           modelAttribute="event">

    <form:hidden path="id"/> <br />
    Nazwa: <form:input path="name"/> <br />

    Data: <form:input path="date" type="date"/> <br />

    Godzina rozpoczęcia: <form:input path="startTime" type="time"/> <br />

    Godzina zakończenia: <form:input path="endTime" type="time"/> <br />

    Konkurencje:
    <jsp:useBean id="allCompetitions" scope="request" type="java.util.List"/>
    <form:checkboxes path="competitionList" items="${allCompetitions}"
                 itemLabel="name" itemValue="id"/>

    <input type="submit" value="Zapisz!"/>

</form:form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>