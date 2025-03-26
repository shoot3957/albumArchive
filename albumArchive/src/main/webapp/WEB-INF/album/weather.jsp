<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현재 날씨</title>
</head>
<body>
    <h1>현재 날씨 정보</h1>

    <c:if test="${not empty weatherData}">
        <p>현재 기온: ${weatherData.response.body.items[0].obsrValue} °C</p>
        <p>날씨 상태: ${weatherData.response.body.items[0].weather}</p>
    </c:if>

    <c:if test="${empty weatherData}">
        <p>날씨 정보를 가져오는 데 실패했습니다.</p>
    </c:if>
</body>
</html>
