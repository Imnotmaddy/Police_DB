<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="infotag" uri="/WEB-INF/tag/infoTag.tld" %>
<html>
<head>
    <title>Documents</title>
    <script data-require="jquery@2.0.3" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script data-require="jquery@1.10.19" data-semver="1.10.19" type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

    <script>
        <%@include file="/js/modal_script.js"%>
        <%@include file="/js/table.js"%>
    </script>
    <style>
        <%@include file="/css/table_style.css"%>
    </style>

    <c:set var="language" value="${sessionScope.lang}"/>
    <fmt:setLocale value="${language}"/>
    <fmt:setBundle basename="resources.properties.text" var="local"/>
    <fmt:message bundle="${local}" key="back" var="back"/>
</head>
<body>

<div style="padding: 100px 0px">
    <div class="well">
        <table class="table table-striped table-bordered table-hover" id="table_id">
            <thead>
            <tr>
                <th>#</th>
                <th>Photo</th>
                <th>Owner statement</th>
                <th>Type statement</th>
                <th>Information</th>
                <th>Reward</th>
                <th>Date</th>
                <th>Lead date</th>
                <th style="width: 36px;"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="doc" items="${docs}">
                <tr>

                    <td>${doc.getDocId()}</td>
                    <td id="statya">
                        <c:choose>
                            <c:when test="${not empty doc.encodedPhoto}">
                                <img src="data:image/jpeg;base64,${doc.encodedPhoto}"/>
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${doc.getName()} ${doc.getLastName()}</td>
                    <td>${doc.getStatement()}</td>
                    <td style="width: 320px;">
                        <div class="col" style="width: 280px">
                                ${doc.getInformation()}
                        </div>
                    </td>
                    <td>${doc.getReward()}</td>
                    <td>${doc.getTime()}</td>
                    <td>${doc.getLeadTime()}</td>
                    <td>
                        <form action="/police" method="get">
                            <input type="hidden" value="APPROVE_PAGE" name="command">
                            <a href="police?command=APPROVE_PAGE&id=${doc.getDocId()}"><i
                                    class="icon icon-ok"></i></a>
                        </form>
                        <form action="/police" method="get">
                            <input type="hidden" value="REMOVE_DOC" name="command">
                            <a href="police?command=REMOVE_DOC&id=${doc.getDocId()}"><i
                                    class="icon-fixed-width icon-trash"></i></a>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<a style="padding-top: 100px;padding-bottom: 100px" href="/jsp/main/main.jsp">${back}</a>

<div style='position:fixed;bottom:0;left:0;
            background:lightgray;width:100%;'>
    <infotag:getinfo/>
</div>


</body>
</html>


