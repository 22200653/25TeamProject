<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>관리자 - 모집글 수정</title>
    <style>
        body{margin:0;font-family:Arial;background:#f5f6f7;}
        .wrap{width:760px;max-width:calc(100% - 32px);margin:24px auto;}
        .card{background:#fff;border:1px solid #e9ecef;border-radius:12px;padding:18px;}
        .field{margin-top:12px;}
        label{display:block;font-weight:900;margin-bottom:8px;}
        input,textarea,select{width:100%;padding:12px;border:1px solid #e9ecef;border-radius:10px;}
        textarea{min-height:140px;resize:vertical;}
        .btnrow{display:flex;gap:10px;justify-content:flex-end;margin-top:14px;}
        .btn{padding:10px 12px;border:1px solid #e9ecef;border-radius:10px;background:#fff;cursor:pointer;font-weight:900;}
        .btn.primary{background:#e9f6ff;border-color:#cfeaff;color:#2da8ff;}
    </style>
</head>
<body>
<div class="wrap">
    <div class="card">
        <h2 style="margin:0;">모집글 수정</h2>

        <form method="post" action="${pageContext.request.contextPath}/admin/recruit/update">
            <input type="hidden" name="id" value="${recruit.id}"/>

            <div class="field">
                <label>동아리명</label>
                <input name="title" value="${recruit.title}" required/>
            </div>

            <div class="field">
                <label>동아리 설명</label>
                <textarea name="description">${recruit.description}</textarea>
            </div>

            <div class="field">
                <label>카테고리</label>
                <select name="category" required>
                    <option value="">카테고리 선택</option>
                    <option value="공연" ${recruit.category eq '공연' ? 'selected' : ''}>공연</option>
                    <option value="전산전자" ${recruit.category eq '전산전자' ? 'selected' : ''}>전산전자</option>
                    <option value="체육" ${recruit.category eq '체육' ? 'selected' : ''}>체육</option>
                    <option value="신앙" ${recruit.category eq '신앙' ? 'selected' : ''}>신앙</option>
                    <option value="봉사" ${recruit.category eq '봉사' ? 'selected' : ''}>봉사</option>
                    <option value="콘디" ${recruit.category eq '콘디' ? 'selected' : ''}>콘디</option>
                    <option value="컴케" ${recruit.category eq '컴케' ? 'selected' : ''}>컴케</option>
                    <option value="국제어문" ${recruit.category eq '국제어문' ? 'selected' : ''}>국제어문</option>
                </select>

                <c:if test="${recruit.category ne null
                             and recruit.category ne ''
                             and recruit.category ne '공연'
                             and recruit.category ne '전산전자'
                             and recruit.category ne '체육'
                             and recruit.category ne '신앙'
                             and recruit.category ne '봉사'
                             and recruit.category ne '콘디'
                             and recruit.category ne '컴케'
                             and recruit.category ne '국제어문'}">
                    <div style="margin-top:8px;color:#777;font-size:13px;">
                        현재 저장된 카테고리 값: <b>${recruit.category}</b>
                        (목록에 없으면 새 카테고리로 다시 선택해서 저장해줘)
                    </div>
                </c:if>
            </div>

            <div class="field">
                <label>모집 마감일(선택)</label>
                <!-- recruit.deadline 이 LocalDate면 이미 yyyy-MM-dd 형태로 출력됨 -->
                <input type="date" name="deadline" value="${recruit.deadline}"/>
            </div>

            <div class="field">
                <label>동아리 사진 URL(선택)</label>
                <input name="imageUrl" value="${recruit.imageUrl}" placeholder="https://..."/>
            </div>

            <div class="btnrow">
                <button type="button" class="btn"
                        onclick="location.href='${pageContext.request.contextPath}/admin/recruit/list'">취소</button>
                <button type="submit" class="btn primary">저장</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
