<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Rankingi</title>
    <link rel="stylesheet" href="/css/style.css">

<%--    <style>--%>
<%--        .new {--%>
<%--            background-color: #111111;--%>
<%--        }--%>
<%--        h3 {--%>
<%--            display: inline;--%>
<%--            text-align: center;--%>
<%--            background: cornflowerblue;--%>
<%--        }--%>
<%--        a{--%>
<%--            color: white;--%>
<%--        }--%>
<%--    </style>--%>
</head>

<body class="new">
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