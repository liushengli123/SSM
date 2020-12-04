<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>物料id</th>
        <th>物料编号</th>
        <th>物料单位</th>
        <th>物料描述</th>
        <th>物料版本号</th>
        <th>物料是否启用</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>创建人</th>
        <th>创建时间</th>
        <th>更新人</th>
        <th>更新时间</th>
    </tr>
    <c:forEach items="${material}" var="material">
        <tr>
            <td>${material.id}</td>
            <td>${material.code}</td>
            <td>${material.uom}</td>
            <td>${material.description}</td>
            <td>${material.version}</td>
            <td>${material.flag}</td>
            <td>${material.start_time}</td>
            <td>${material.end_time}</td>
            <td>${material.create_user}</td>
            <td>${material.create_time}</td>
            <td>${material.update_user}</td>
            <td>${material.update_time}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
