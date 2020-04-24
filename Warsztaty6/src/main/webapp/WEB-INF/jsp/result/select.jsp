<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Rankingi</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form action="addEvent" method="get">
    <input type="submit" value="Dodaj wynik">
</form>

<h3><a href="resultList">Ranking według konkurencji</a></h3>
<h3><a href="setCompetitor">Ranking według zawodnika</a></h3>
<h3><a href="setEvent">Ranking według zawodów</a></h3>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>