<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>ClubList</title>
    <style>
        body { font-family: Arial; margin:0; }
        .topbar { display:flex; justify-content:space-between; padding:16px 24px; border-bottom:1px solid #eee; }
        .brand { font-size:22px; font-weight:700; }
        .actions button { margin-left:8px; }
        .banner { background:#cfefff; padding:18px 24px; margin:18px 24px; border-radius:10px; }
        .container { margin: 0 24px 40px; }
        .card { border:1px solid #eee; border-radius:10px; padding:14px; margin:10px 0; }
        .card a { text-decoration:none; color:#111; display:block; }
        .desc { color:#666; margin-top:6px; }
    </style>
</head>
<body>

<div class="topbar">
    <div class="brand">ClubList</div>
    <div class="actions">
        <button onclick="location.href='#'">회원가입</button>
        <button onclick="location.href='#'">로그인</button>
        <span style="margin-left:10px;">👤</span>
    </div>
</div>

<div class="banner">
    <b>동아리 모집 사이트</b><br/>
    이 사이트는 동아리 모집글을 보고, 지원서를 제출/관리할 수 있습니다.
</div>

<div class="container">
    <h3>동아리 모집글 리스트</h3>

    <c:forEach var="r" items="${recruits}">
        <div class="card">
            <a href="${pageContext.request.contextPath}/recruit/detail?id=${r.id}">
                <b>${r.title}</b>
                <div class="desc">${r.description}</div>
            </a>
        </div>
    </c:forEach>

</div>
</body>
</html>
