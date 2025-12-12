<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>지원서 추가</title>
</head>
<body style="font-family:Arial; padding:18px 24px;">
<h2>지원서 추가</h2>

<form action="${pageContext.request.contextPath}/application/create" method="post">
    <input type="hidden" name="recruitId" value="${param.recruitId}"/>

    이름: <input name="name" required/><br/><br/>
    학년: <input name="grade" type="number"/><br/><br/>
    전공: <input name="major"/><br/><br/>
    내용:<br/>
    <textarea name="message" rows="6" cols="60"></textarea><br/><br/>

    <button type="submit">저장</button>
    <button type="button" onclick="history.back()">취소</button>
</form>

</body>
</html>