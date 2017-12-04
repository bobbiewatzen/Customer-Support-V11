<%--@elvariable id="timestamp" type="long"--%>
<%--@elvariable id="numberOfSessions" type="int"--%>
<%--@elvariable id="sessionList" type="java.util.List<javax.servlet.http.HttpSession>"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jsun" uri="http://www.jsun.com/jsp/tld/jsun" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:basic htmlTitle="Active Sessions" bodyTitle="Active Sessions">
    There are a total of ${numberOfSessions} active sessions in this
    application.<br /><br />
    <c:forEach items="${sessionList}" var="s">
        <c:out value="${s.id} - ${s.getAttribute('com.jsun.user.principal')}" />
        <c:if test="${s.id == pageContext.session.id}">&nbsp;(you)</c:if>
        &nbsp;- last active
        ${jsun:timeIntervalToString(timestamp - s.lastAccessedTime)} ago<br />
    </c:forEach>
</template:basic>
