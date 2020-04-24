<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form:form method="post"
           modelAttribute="competitor" action="edit">

    <form:hidden path="id"/>
    <form:hidden path="firstName"/>
    <form:hidden path="lastName"/>
    <form:hidden path="cardNumber"/>
    <form:hidden path="patentNumber"/>
    <form:hidden path="clubName"/>
    <form:hidden path="email"/>
    <form:hidden path="password"/>
    <form:hidden path="competitionList"/>


    <c:forEach items="${superList}" var="s">

        <c:forEach items="${s}" var="start" end="0">
            <p>${start.competition.name}</p>
        </c:forEach>
        <P>
        <form:select path="starts" items="${s}"
                             itemLabel="begin" itemValue="id"/>
            </p>

    </c:forEach>

        <input type="submit" value="Wybierz!"/>

</form:form>

