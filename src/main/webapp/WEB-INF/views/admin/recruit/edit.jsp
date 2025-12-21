<%@ page contentType="text/html; charset=UTF-8" %>
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
        input,textarea{width:100%;padding:12px;border:1px solid #e9ecef;border-radius:10px;}
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
                <input name="category" value="${recruit.category}" required/>
            </div>

            <div class="field">
                <label>모집 마감일(선택)</label>
                <input type="date" name="deadline" value="${recruit.deadline}"/>
            </div>

            <div class="field">
                <label>동아리 사진 URL(선택)</label>
                <input name="imageUrl" value="${recruit.imageUrl}" placeholder="https://..."/>
            </div>

            <div class="btnrow">
                <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/recruit/list'">취소</button>
                <button type="submit" class="btn primary">저장</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
