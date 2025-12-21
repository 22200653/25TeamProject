<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>관리자 - 모집글 관리</title>
    <style>
        body{margin:0;font-family:Arial;background:#f5f6f7;}
        .wrap{width:1020px;max-width:calc(100% - 32px);margin:24px auto;}
        .card{background:#fff;border:1px solid #e9ecef;border-radius:12px;padding:18px;}
        .top{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;}
        .btn{padding:10px 12px;border:1px solid #e9ecef;border-radius:10px;background:#fff;cursor:pointer;font-weight:900;}
        .btn.primary{background:#e9f6ff;border-color:#cfeaff;color:#2da8ff;}
        table{width:100%;border-collapse:collapse;}
        th,td{border-bottom:1px solid #e9ecef;padding:12px 10px;text-align:left;}
        th{color:#777;font-weight:900;}
        .actions{display:flex;gap:8px;}
        form{margin:0;}
    </style>
</head>
<body>
<div class="wrap">
    <div class="card">
        <div class="top">
            <h2 style="margin:0;">관리자 - 모집글 관리</h2>
            <div style="display:flex;gap:8px;">
                <button class="btn" onclick="location.href='${pageContext.request.contextPath}/home'">홈</button>
                <button class="btn primary" onclick="location.href='${pageContext.request.contextPath}/admin/recruit/add'">+ 모집글 추가</button>
            </div>
        </div>

        <table>
            <thead>
            <tr>
                <th style="width:70px;">ID</th>
                <th>동아리명</th>
                <th style="width:140px;">카테고리</th>
                <th style="width:140px;">마감일</th>
                <th style="width:110px;">조회수</th>
                <th style="width:110px;">좋아요</th>
                <th style="width:180px;">관리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="r" items="${recruits}">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.title}</td>
                    <td>${r.category}</td>
                    <td>
                        <c:choose>
                            <c:when test="${r.deadline == null}">상시</c:when>
                            <c:otherwise>${r.deadline}</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${r.viewCount}</td>
                    <td>${r.likeCount}</td>
                    <td>
                        <div class="actions">
                            <button class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/recruit/edit?id=${r.id}'">수정</button>
                            <form method="post" action="${pageContext.request.contextPath}/admin/recruit/delete">
                                <input type="hidden" name="id" value="${r.id}"/>
                                <button class="btn" type="submit" onclick="return confirm('삭제할까요?');">삭제</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty recruits}">
                <tr><td colspan="7" style="color:#777;font-weight:900;padding:18px;">모집글이 없습니다.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
