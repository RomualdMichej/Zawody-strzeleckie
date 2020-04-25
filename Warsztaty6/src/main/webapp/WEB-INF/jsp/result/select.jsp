<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Rankingi</title>
    <style>
        h3 {
            display: inline;
            text-align: center;
        }
        div{
            display: table;
            margin: 0 auto;
        }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<div>
<form action="addEvent" method="get">
    <input type="submit" value="Dodaj wynik">
</form>
</div>
<div>
<h3><a href="resultList">Ranking według konkurencji&nbsp;</a></h3>
<h3><a href="setCompetitor">&nbsp;Ranking według zawodnika&nbsp;</a></h3>
<h3><a href="setEvent">&nbsp;Ranking według zawodów</a></h3>
</div>
<div><%@ include file="/WEB-INF/jsp/footer.jsp" %></div>
</body>
</html>