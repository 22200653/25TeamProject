<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>지원서 상세</title>
</head>
<body style="font-family:Arial; padding:18px 24px;">
<h2>지원서 상세</h2>

<p><b>ID:</b> ${app.id}</p>
<p><b>이름:</b> ${app.name}</p>
<p><b>학년:</b> ${app.grade}</p>
<p><b>전공:</b> ${app.major}</p>
<p><b>내용:</b><br/> <pre style="white-space:pre-wrap;">${app.message}</pre></p>

<button onclick="location.href='${pageContext.request.contextPath}/recruit/detail?id=${app.recruitId}'">목록으로</button>
</body>
</html>