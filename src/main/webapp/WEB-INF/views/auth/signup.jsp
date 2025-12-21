<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>회원가입</title>
    <style>
        body{font-family:Arial; background:#f5f6f7; margin:0;}
        .box{width:420px; margin:80px auto; background:#fff; border:1px solid #e9ecef; border-radius:12px; padding:22px;}
        h2{margin:0 0 14px;}
        input{width:100%; padding:12px; border:1px solid #e9ecef; border-radius:10px; margin:8px 0;}
        .btn{width:100%; padding:12px; border:0; border-radius:10px; background:#2da8ff; color:#fff; font-weight:800; cursor:pointer;}
        .link{display:block; margin-top:12px; text-align:center; font-weight:700;}
        .err{color:#e11d48; font-weight:800; margin:8px 0;}
    </style>
</head>
<body>
<div class="box">
    <h2>회원가입</h2>
    <c:if test="${not empty error}">
        <div class="err">${error}</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/auth/signup">
        <input name="userid" placeholder="아이디" required/>
        <input name="password" type="password" placeholder="비밀번호" required/>
        <input name="username" placeholder="이름" required/>
        <button class="btn" type="submit">가입하기</button>
    </form>
    <a class="link" href="${pageContext.request.contextPath}/auth/login">로그인으로</a>
</div>
</body>
</html>
