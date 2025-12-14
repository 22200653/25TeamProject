<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>지원서 수정</title>
</head>
<body style="font-family:Arial; padding:18px 24px;">
<h2>지원서 수정</h2>

<form action="${pageContext.request.contextPath}/application/update" method="post">
    <input type="hidden" name="id" value="${app.id}"/>
    <input type="hidden" name="recruitId" value="${app.recruitId}"/>

    이름: <input name="name" value="${app.name}" required/><br/><br/>
    학년: <input name="grade" type="number" value="${app.grade}"/><br/><br/>
    전공: <input name="major" value="${app.major}"/><br/><br/>
    내용:<br/>
    <textarea name="message" rows="6" cols="60">${app.message}</textarea><br/><br/>

    <button type="submit">수정 저장</button>
    <button type="button" onclick="history.back()">취소</button>
</form>

</body>
</html>