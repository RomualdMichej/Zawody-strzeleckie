<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>


<h2>DODAWANIE NOWYCH ZAWODNIKÓW</h2>


<form:form method="post"
           modelAttribute="competitor">

    <form:hidden path="id"/> <br />
    <form:hidden path="competitionList"/> <br />
    Imię: <form:input path="firstName"/> <br />

    Nazwisko: <form:input path="lastName"/> <br />

    Numer legitymacji: <form:input path="cardNumber"/> <br />

    Numer Patentu: <form:input path="patentNumber"/> <br />

    Nazwa klubu: <form:input path="clubName"/> <br />

    Email: <form:input path="email"/> <br />

    Hasło: <form:input path="password"/> <br />

<%--    Starty:--%>
<%--    <jsp:useBean id="allStarts" scope="request" type="java.util.List"/>--%>
<%--    <form:checkboxes path="starts" items="${allStarts}"--%>
<%--                     itemLabel="begin" itemValue="id"/>--%>

    <input type="submit" value="Zapisz!"/>

</form:form>