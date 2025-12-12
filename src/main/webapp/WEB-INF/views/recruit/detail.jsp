<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>모집글 상세</title>
    <style>
        body { font-family: Arial; margin:0; }
        .top { padding:18px 24px; border-bottom:1px solid #eee; }
        .catbar { padding:10px 24px; border-bottom:1px solid #eee; color:#444; }
        .container { padding:18px 24px; }
        .btn { padding:8px 10px; border:1px solid #ddd; border-radius:8px; background:#fff; cursor:pointer; }
        table { width:100%; border-collapse:collapse; margin-top:12px; }
        th, td { border-bottom:1px solid #eee; padding:10px; text-align:left; }
        .actions { display:flex; gap:6px; }
        a { text-decoration:none; }
    </style>
</head>
<body>

<div class="top">
    <div style="display:flex; justify-content:space-between; align-items:center;">
        <div>
            <h2 style="margin:0;">${recruit.title}</h2>
            <div style="color:#666; margin-top:6px;">${recruit.description}</div>
        </div>
        <button class="btn" onclick="location.href='${pageContext.request.contextPath}/home'">← 메인</button>
    </div>
</div>

<div class="catbar">
    카테고리 바 (임의): <b>${recruit.category}</b>
</div>

<div class="container">
    <div style="display:flex; justify-content:space-between; align-items:center;">
        <h3 style="margin:0;">지원서 리스트</h3>
        <button class="btn"
                onclick="location.href='${pageContext.request.contextPath}/application/add?recruitId=${recruit.id}'">
            + 지원서 추가
        </button>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>학년</th>
            <th>전공</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="a" items="${apps}">
            <tr>
                <td>${a.id}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/application/view?id=${a.id}">
                            ${a.name}
                    </a>
                </td>
                <td>${a.grade}</td>
                <td>${a.major}</td>
                <td>
                    <div class="actions">
                        <button class="btn"
                                onclick="location.href='${pageContext.request.contextPath}/application/edit?id=${a.id}'">
                            수정
                        </button>

                        <form action="${pageContext.request.contextPath}/application/delete" method="post" style="margin:0;">
                            <input type="hidden" name="id" value="${a.id}"/>
                            <input type="hidden" name="recruitId" value="${recruit.id}"/>
                            <button class="btn" type="submit">삭제</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
